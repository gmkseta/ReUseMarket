ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      panel "최근 신고 내역" do

      table border:"0",cellspacing:"0", cellpadding:"0", id:"index_table_image_infos" ,class:"index_table index" do
        render "thead"
        tbody do
          Singo.order("created_at desc").limit(4).map do |s|
            tr class:"odd",id:"singo_#{s.id}" do
              td class:"col col-id" do
                s.id
              end
              td class:"col col-content" do
                s.content
              end
              td class:"col col-user" do
                s.user.name
              end
              td class:"col col-sel" do
                s.sel
              end
              td class:"col col-item" do
                s.item.name
              end
              td class:"col col-status" do
                s.status
              end
              td class:"col col-created_at" do
                s.created_at.strftime("%y %b %d %I:%M %p")
              end
            end
          end#sindo

        end #tbody

      end #table
    end #panel
  end #colums
    columns do
      column do
        panel "최근 거래 내역" do
          table border:"0",cellspacing:"0", cellpadding:"0", id:"index_table_image_infos" ,class:"index_table index" do
            render "trade_head"
            tbody do
              Trade.order("created_at desc").limit(4).map do |t|
                tr class:"odd",id:"trade_#{t.id}" do
                  td class:"col col-id" do
                    t.id
                  end
                  td class:"col col-content" do
                    t.seller.name
                  end
                  td class:"col col-user" do
                    t.customer.name
                  end
                  td class:"col col-sel" do
                    t.item.name
                  end
                  td class:"col col-item" do
                    t.status
                  end
                  td class:"col col-created_at" do
                    t.created_at.strftime("%y %b %d %I:%M %p")
                  end
                end
              end#sindo

            end #tbody

          end #table
        end
      end
      column do
        panel "물품 게시 내역" do
          table border:"0",cellspacing:"0", cellpadding:"0", id:"index_table_image_infos" ,class:"index_table index" do
            render "item_head"
            tbody do
              Item.order("created_at desc").limit(4).map do |i|
                tr class:"odd",id:"item_#{i.id}" do
                  td class:"col col-id" do
                    img src:i.item_images[0].url(:thumb)
                  end
                  td class:"col col-content" do
                    i.name
                  end
                  td class:"col col-user" do
                    i.user.name
                  end

                  td class:"col col-created_at" do
                    i.created_at.strftime("%y %b %d %I:%M %p")
                  end
                end
              end#sindo

            end #tbody

          end #table
        end
      end
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end


  end # content
end
