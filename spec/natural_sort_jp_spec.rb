# frozen_string_literal: true

require 'natural_sort_jp'

RSpec.describe NaturalSortJp do
  context '数字と日本語の混合' do
    context 'n回' do
      context '数字が全て半角' do
        let(:a) { '1回' }
        let(:b) { '2回' }
        let(:c) { '10回' }
        let(:d) { '3回' }
        let(:e) { '4回' }

        it '並び替えが数字順になる' do
          expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
        end
      end

      context '数字が全て全角' do
        let(:a) { '１回' }
        let(:b) { '２回' }
        let(:c) { '１０回' }
        let(:d) { '３回' }
        let(:e) { '４回' }

        it '並び替えが数字順になる' do
          expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
        end
      end

      context '数字が半角と全角の混合' do
        let(:a) { '１回' }
        let(:b) { '2回' }
        let(:c) { '１０回' }
        let(:d) { '3回' }
        let(:e) { '４回' }

        it '並び替えが数字順になる' do
          expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
        end
      end
    end

    context '第n回' do
      context '数字が全て半角' do
        let(:a) { '第1回' }
        let(:b) { '第2回' }
        let(:c) { '第10回' }
        let(:d) { '第3回' }
        let(:e) { '第4回' }

        it '並び替えが数字順になる' do
          expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
        end
      end

      context '数字が全て全角' do
        let(:a) { '第１回' }
        let(:b) { '第２回' }
        let(:c) { '第１０回' }
        let(:d) { '第３回' }
        let(:e) { '第４回' }

        it '並び替えが数字順になる' do
          expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
        end
      end

      context '数字が半角と全角の混合' do
        let(:a) { '第１回' }
        let(:b) { '第2回' }
        let(:c) { '第１０回' }
        let(:d) { '第3回' }
        let(:e) { '第4回' }

        it '並び替えが数字順になる' do
          expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
        end
      end
    end

    context '第n' do
      context '数字が全て半角' do
        let(:a) { '第1' }
        let(:b) { '第2' }
        let(:c) { '第10' }
        let(:d) { '第3' }
        let(:e) { '第4' }

        it '並び替えが数字順になる' do
          expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
        end
      end

      context '数字が全て全角' do
        let(:a) { '第１' }
        let(:b) { '第２' }
        let(:c) { '第１０' }
        let(:d) { '第３' }
        let(:e) { '第４' }

        it '並び替えが数字順になる' do
          expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
        end
      end

      context '数字が半角と全角の混合' do
        let(:a) { '第１' }
        let(:b) { '第2' }
        let(:c) { '第１０' }
        let(:d) { '第3' }
        let(:e) { '第4' }

        it '並び替えが数字順になる' do
          expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
        end
      end
    end
  end

  context '日付の形式' do
    context 'yyyy/mm/dd' do
      context '0詰めあり' do
        context '数字が全て半角' do
          let(:a) { '2022/01/01' }
          let(:b) { '2022/01/02' }
          let(:c) { '2023/01/01' }
          let(:d) { '2022/01/10' }
          let(:e) { '2022/02/01' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全て全角' do
          let(:a) { '２０２２/０１/０１' }
          let(:b) { '２０２２/０１/０２' }
          let(:c) { '２０２３/０１/０１' }
          let(:d) { '２０２２/０１/１０' }
          let(:e) { '２０２２/０２/０１' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全角半角混合' do
          let(:a) { '2022/01/01' }
          let(:b) { '２０２２/０１/０２' }
          let(:c) { '２０２３/０１/１０' }
          let(:d) { '2022/01/10' }
          let(:e) { '2022/02/01' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end
      end

      context '0詰めなし' do
        context '数字が全て半角' do
          let(:a) { '2022/1/1' }
          let(:b) { '2022/1/2' }
          let(:c) { '2023/1/1' }
          let(:d) { '2022/1/10' }
          let(:e) { '2022/2/1' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全て全角' do
          let(:a) { '２０２２/１/１' }
          let(:b) { '２０２２/１/２' }
          let(:c) { '２０２３/１/１' }
          let(:d) { '２０２２/１/１０' }
          let(:e) { '２０２２/２/１' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全角半角混合' do
          let(:a) { '2022/1/1' }
          let(:b) { '２０２２/１/２' }
          let(:c) { '２０２３/１/１０' }
          let(:d) { '2022/1/10' }
          let(:e) { '2022/2/1' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end
      end

      context '0詰めありなし混合' do
        context '数字が全て半角' do
          let(:a) { '2022/1/1' }
          let(:b) { '2022/01/2' }
          let(:c) { '2023/1/1' }
          let(:d) { '2022/01/10' }
          let(:e) { '2022/02/1' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全て全角' do
          let(:a) { '２０２２/０１/１' }
          let(:b) { '２０２２/０１/２' }
          let(:c) { '２０２３/１/１' }
          let(:d) { '２０２２/０１/１０' }
          let(:e) { '２０２２/２/１' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全角半角混合' do
          let(:a) { '2022/01/1' }
          let(:b) { '２０２２/１/２' }
          let(:c) { '２０２３/０１/１０' }
          let(:d) { '2022/1/10' }
          let(:e) { '2022/02/1' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end
      end
    end

    context 'yyyy-mm-dd' do
      context '0詰めあり' do
        context '数字が全て半角' do
          let(:a) { '2022-01-01' }
          let(:b) { '2022-01-02' }
          let(:c) { '2023-01-01' }
          let(:d) { '2022-01-10' }
          let(:e) { '2022-02-01' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全て全角' do
          let(:a) { '２０２２-０１-０１' }
          let(:b) { '２０２２-０１-０２' }
          let(:c) { '２０２３-０１-０１' }
          let(:d) { '２０２２-０１-１０' }
          let(:e) { '２０２２-０２-０１' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全角半角混合' do
          let(:a) { '2022-01-01' }
          let(:b) { '２０２２-０１-０２' }
          let(:c) { '２０２３-０１-１０' }
          let(:d) { '2022-01-10' }
          let(:e) { '2022-02-01' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end
      end

      context '0詰めなし' do
        context '数字が全て半角' do
          let(:a) { '2022-1-1' }
          let(:b) { '2022-1-2' }
          let(:c) { '2023-1-1' }
          let(:d) { '2022-1-10' }
          let(:e) { '2022-2-1' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全て全角' do
          let(:a) { '２０２２-１-１' }
          let(:b) { '２０２２-１-２' }
          let(:c) { '２０２３-１-１' }
          let(:d) { '２０２２-１-１０' }
          let(:e) { '２０２２-２-１' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全角半角混合' do
          let(:a) { '2022-1-1' }
          let(:b) { '２０２２-１-２' }
          let(:c) { '２０２３-１-１０' }
          let(:d) { '2022-1-10' }
          let(:e) { '2022-2-1' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end
      end

      context '0詰めありなし混合' do
        context '数字が全て半角' do
          let(:a) { '2022-1-1' }
          let(:b) { '2022-01-2' }
          let(:c) { '2023-1-1' }
          let(:d) { '2022-01-10' }
          let(:e) { '2022-02-1' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全て全角' do
          let(:a) { '２０２２-０１-１' }
          let(:b) { '２０２２-０１-２' }
          let(:c) { '２０２３-１-１' }
          let(:d) { '２０２２-０１-１０' }
          let(:e) { '２０２２-２-１' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end

        context '数字が全角半角混合' do
          let(:a) { '2022-01-1' }
          let(:b) { '２０２２-１-２' }
          let(:c) { '２０２３-０１-１０' }
          let(:d) { '2022-1-10' }
          let(:e) { '2022-02-1' }

          it '並び替えが日付順になる' do
            expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, d, e, c])
          end
        end
      end
    end

    context '複数形式の混合' do
      let(:a) { '2022/01/01' }
      let(:b) { '2022/01/02' }
      let(:c) { '2023/01/10' }
      let(:d) { '2022-01-10' }
      let(:e) { '2022-02-01' }

      it '区切りの記号のsort順に依存' do
        expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([d, e, a, b, c])
      end
    end
  end

  context '全角と半角のアルファベットの混合' do
    let(:a) { 'a' }
    let(:b) { 'ｂ' }
    let(:c) { 'ｃ' }
    let(:d) { 'd' }
    let(:e) { 'ｅ' }

    it '並び替えが日付順になる' do
      expect(NaturalSortJp.sort([a, b, c, d, e])).to eql([a, b, c, d, e])
    end
  end

  context 'by引数ありの場合' do
    context 'Hash' do
      let(:a) { { title: '第1回定例',  id: 10 } }
      let(:b) { { title: '第2回定例',  id: 20 } }
      let(:c) { { title: '第１０回定例',  id: 12 } }
      let(:d) { { title: '第20回定例',  id: 1 } }
      let(:e) { { title: '第３回定例', id: 2 } }

      it '並び替えがタイトル順になる' do
        expect(NaturalSortJp.sort([a, b, c, d, e], by: :title)).to eql([a, b, e, c, d])
      end
    end

    context 'Struct' do
      let(:struct) { Struct.new(:title, :id) }
      let(:a) { struct.new('第1回定例', 10) }
      let(:b) { struct.new('第2回定例', 20) }
      let(:c) { struct.new('第１０回定例', 12) }
      let(:d) { struct.new('第20回定例', 1) }
      let(:e) { struct.new('第３回定例', 2) }

      it '並び替えがタイトル順になる' do
        expect(NaturalSortJp.sort([a, b, c, d, e], by: :title)).to eql([a, b, e, c, d])
      end
    end
  end
end
