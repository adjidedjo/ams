class CategorySubmissionPdf < Prawn::Document
    include ActionView::Helpers::NumberHelper
    def initialize(catsub, comments)
      super({:page_size => 'FOLIO', :margin => [50, 40, 30, 60]})
      @catsub = catsub
      @comments = comments
      @question = @catsub.user_answers
      @temp_cursor = 0
      repeat(:all) do
        order_number
      end
      header
      body
      list_comments
      # term_conditions
      stamps
    #   second_header
    #   footer
    end

    def stamps
      create_stamp('approved') do
        rotate(30, origin: [-5, -5]) do
          stroke_color 'FF3333'
          stroke_ellipse [0, 0], 29, 15
          stroke_color '000000'
          fill_color '993333'
          font('Times-Roman') do
            draw_text 'Approved', at: [-23, -3]
          end
          fill_color '000000'
        end
      end
      stamp_at 'approved', [500, cursor] if @catsub.published?
    end

    def order_number
      # define_grid(columns: 5, rows: 8, gutter: 10)
      float do
        bounding_box([0, cursor], :width => 500) do
          image "#{Rails.root}/public/royalcorp.png", :width => 50, :height => 50, at: [10, cursor]
          move_down 20
          text "ROYAL CORPORATION", size: 15, style: :bold, align: :center
          move_down 20
          stroke_bounds
          move_down 10
          draw_text("Document No.", size: 8, at: [10, cursor])
          draw_text("RAS-0416-ISMS-T01", size: 8, at: [100, cursor])
          draw_text("Secret Level", size: 8, at: [200, cursor])
          draw_text("Unclassified", size: 8, at: [300, cursor])
          draw_text("Version", size: 8, at: [400, cursor])
          draw_text("1.0", size: 8, at: [450, cursor])
          move_down 5
          stroke_bounds
          move_down 20
          @temp_cursor += bounds.height
        end
      end
    end

    def header
      float do
      bounding_box([0, cursor - @temp_cursor], :width => 500) do
        indent 5 do
          text "#{@catsub.category.name}", size: 15, style: :bold, align: :center
          move_down 40
          draw_text("Record Number", :size => 10, :at => [([bounds.left, cursor]), 0])
          draw_text(":", :size => 10, :at => [([bounds.left + 90, cursor]), 0])
          draw_text("#{@catsub.id}", :size => 10, :at => [([bounds.left + 100, cursor]), 0])

          draw_text("Date", :size => 10, :at => [([bounds.left, cursor - 20]), 0])
          draw_text(":", :size => 10, :at => [([bounds.left + 90, cursor - 20]), 0])
          draw_text("#{@catsub.created_at.strftime("%d/%m/%Y")}", :size => 10, :at => [([bounds.left + 100, cursor - 20]), 0])
          draw_text("Department Name", :size => 10, :at => [([bounds.left, cursor - 40]), 0])
          draw_text(":", :size => 10, :at => [([bounds.left + 90, cursor - 40]), 0])
          draw_text("IT", :size => 10, :at => [([bounds.left + 100, cursor - 40]), 0])
          draw_text("Employee No", :size => 10, :at => [([bounds.left, cursor - 60]), 0])
          draw_text(":", :size => 10, :at => [([bounds.left + 90, cursor - 60]), 0])
          draw_text("#{@catsub.user.id}", :size => 10, :at => [([bounds.left + 100, cursor - 60]), 0])


          draw_text("Area", :size => 10, :at => [([bounds.left + 300, cursor - 20]), 0])
          draw_text(":", :size => 10, :at => [([bounds.left + 400, cursor - 20]), 0])
          draw_text("PUSAT", :size => 10, :at => [([bounds.left + 410, cursor - 20]), 0])
          draw_text("Department No", :size => 10, :at => [([bounds.left + 300, cursor - 40]), 0])
          draw_text(":", :size => 10, :at => [([bounds.left + 400, cursor - 40]), 0])
          draw_text("1", :size => 10, :at => [([bounds.left + 410, cursor - 40]), 0])
          draw_text("Name", :size => 10, :at => [([bounds.left + 300, cursor - 60]), 0])
          draw_text(":", :size => 10, :at => [([bounds.left + 400, cursor - 60]), 0])
          draw_text("#{@catsub.user.full_name}", :size => 10, :at => [([bounds.left + 410, cursor - 60]), 0])
          @temp_cursor += (bounds.height + @temp_cursor)
        end
      end
    end
    end

    def body
      column_box([5, cursor - @temp_cursor], columns: 1, width: 500) do
        @gap = 20
        @question.each do |key, value|
          column_box([0, cursor], columns: 1, width: 500, reflow_margin: true) do
            @gap += 20
            text_box "#{key} : #{value}", :size => 12, at: [0, cursor - @gap]
          end
        end
        move_down 10
      end
    end

    def list_comments
      column_box([5, cursor - @temp_cursor], columns: 1, width: 500, height: bounds.height) do
        text "Recent Comments", style: :bold
        gap = 10
        if @comments.empty?
          text_box "No comments", :size => 10, at: [10, cursor], style: :italic
        else
          @comments.each do |comment|
            gap += 20
            column_box([10, cursor], columns: 1, width: 500, reflow_margin: true) do
              text_box "#{comment.user.full_name} has comment : #{comment.body}", style: :italic, :size => 10, at: [0, cursor - gap]
            end
          end
        end
      end
      column_box([0, @temp_cursor], column: 1, width: 800, height: 100, reflow_margin: true) do
        move_down 50
        text "Applicant : #{@catsub.user.full_name}", :size => 10
        move_down 5
        text "Unit/Section Head : #{@catsub.user.report_to.full_name}", :size => 10
        move_down 5
        text "Approved by : #{User.find_by_email(@catsub.category.unit.email_approval_person).full_name if @catsub.published?}", :size => 10
      end
    end
  end