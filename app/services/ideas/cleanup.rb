module Ideas
  class Cleanup
    def call
      Idea.outdated.destroy_all
    end
  end
end
