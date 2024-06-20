; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53356 () Bool)

(assert start!53356)

(declare-fun b!247764 () Bool)

(declare-fun e!171677 () Bool)

(declare-fun e!171673 () Bool)

(assert (=> b!247764 (= e!171677 e!171673)))

(declare-fun res!207346 () Bool)

(assert (=> b!247764 (=> res!207346 e!171673)))

(declare-fun lt!386040 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!247764 (= res!207346 (not (= lt!386040 (bvadd lt!386040 (bvsub nBits!297 from!289)))))))

(declare-datatypes ((array!13526 0))(
  ( (array!13527 (arr!6918 (Array (_ BitVec 32) (_ BitVec 8))) (size!5931 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10784 0))(
  ( (BitStream!10785 (buf!6415 array!13526) (currentByte!11828 (_ BitVec 32)) (currentBit!11823 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10784)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247764 (= lt!386040 (bitIndex!0 (size!5931 (buf!6415 thiss!1005)) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005)))))

(declare-fun b!247765 () Bool)

(declare-fun e!171676 () Bool)

(assert (=> b!247765 (= e!171676 (not e!171677))))

(declare-fun res!207347 () Bool)

(assert (=> b!247765 (=> res!207347 e!171677)))

(assert (=> b!247765 (= res!207347 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10784 BitStream!10784) Bool)

(assert (=> b!247765 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17980 0))(
  ( (Unit!17981) )
))
(declare-fun lt!386037 () Unit!17980)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10784) Unit!17980)

(assert (=> b!247765 (= lt!386037 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun res!207345 () Bool)

(assert (=> start!53356 (=> (not res!207345) (not e!171676))))

(assert (=> start!53356 (= res!207345 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53356 e!171676))

(assert (=> start!53356 true))

(declare-fun e!171675 () Bool)

(declare-fun inv!12 (BitStream!10784) Bool)

(assert (=> start!53356 (and (inv!12 thiss!1005) e!171675)))

(declare-fun b!247766 () Bool)

(declare-datatypes ((tuple2!21250 0))(
  ( (tuple2!21251 (_1!11547 BitStream!10784) (_2!11547 BitStream!10784)) )
))
(declare-fun lt!386039 () tuple2!21250)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247766 (= e!171673 (validate_offset_bits!1 ((_ sign_extend 32) (size!5931 (buf!6415 (_1!11547 lt!386039)))) ((_ sign_extend 32) (currentByte!11828 (_1!11547 lt!386039))) ((_ sign_extend 32) (currentBit!11823 (_1!11547 lt!386039))) (bvsub nBits!297 from!289)))))

(declare-fun lt!386038 () Unit!17980)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10784 array!13526 (_ BitVec 64)) Unit!17980)

(assert (=> b!247766 (= lt!386038 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6415 thiss!1005) (bvsub nBits!297 from!289)))))

(declare-fun reader!0 (BitStream!10784 BitStream!10784) tuple2!21250)

(assert (=> b!247766 (= lt!386039 (reader!0 thiss!1005 thiss!1005))))

(declare-fun b!247767 () Bool)

(declare-fun array_inv!5672 (array!13526) Bool)

(assert (=> b!247767 (= e!171675 (array_inv!5672 (buf!6415 thiss!1005)))))

(declare-fun b!247768 () Bool)

(declare-fun res!207348 () Bool)

(assert (=> b!247768 (=> (not res!207348) (not e!171676))))

(assert (=> b!247768 (= res!207348 (bvsge from!289 nBits!297))))

(declare-fun b!247769 () Bool)

(declare-fun res!207344 () Bool)

(assert (=> b!247769 (=> (not res!207344) (not e!171676))))

(assert (=> b!247769 (= res!207344 (validate_offset_bits!1 ((_ sign_extend 32) (size!5931 (buf!6415 thiss!1005))) ((_ sign_extend 32) (currentByte!11828 thiss!1005)) ((_ sign_extend 32) (currentBit!11823 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53356 res!207345) b!247769))

(assert (= (and b!247769 res!207344) b!247768))

(assert (= (and b!247768 res!207348) b!247765))

(assert (= (and b!247765 (not res!207347)) b!247764))

(assert (= (and b!247764 (not res!207346)) b!247766))

(assert (= start!53356 b!247767))

(declare-fun m!373425 () Bool)

(assert (=> b!247769 m!373425))

(declare-fun m!373427 () Bool)

(assert (=> b!247765 m!373427))

(declare-fun m!373429 () Bool)

(assert (=> b!247765 m!373429))

(declare-fun m!373431 () Bool)

(assert (=> b!247767 m!373431))

(declare-fun m!373433 () Bool)

(assert (=> b!247766 m!373433))

(declare-fun m!373435 () Bool)

(assert (=> b!247766 m!373435))

(declare-fun m!373437 () Bool)

(assert (=> b!247766 m!373437))

(declare-fun m!373439 () Bool)

(assert (=> b!247764 m!373439))

(declare-fun m!373441 () Bool)

(assert (=> start!53356 m!373441))

(push 1)

(assert (not b!247764))

(assert (not b!247769))

(assert (not b!247765))

(assert (not b!247767))

(assert (not b!247766))

(assert (not start!53356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82926 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82926 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5931 (buf!6415 (_1!11547 lt!386039)))) ((_ sign_extend 32) (currentByte!11828 (_1!11547 lt!386039))) ((_ sign_extend 32) (currentBit!11823 (_1!11547 lt!386039))) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5931 (buf!6415 (_1!11547 lt!386039)))) ((_ sign_extend 32) (currentByte!11828 (_1!11547 lt!386039))) ((_ sign_extend 32) (currentBit!11823 (_1!11547 lt!386039)))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21019 () Bool)

(assert (= bs!21019 d!82926))

(declare-fun m!373447 () Bool)

(assert (=> bs!21019 m!373447))

(assert (=> b!247766 d!82926))

(declare-fun d!82928 () Bool)

(assert (=> d!82928 (validate_offset_bits!1 ((_ sign_extend 32) (size!5931 (buf!6415 thiss!1005))) ((_ sign_extend 32) (currentByte!11828 thiss!1005)) ((_ sign_extend 32) (currentBit!11823 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386046 () Unit!17980)

(declare-fun choose!9 (BitStream!10784 array!13526 (_ BitVec 64) BitStream!10784) Unit!17980)

(assert (=> d!82928 (= lt!386046 (choose!9 thiss!1005 (buf!6415 thiss!1005) (bvsub nBits!297 from!289) (BitStream!10785 (buf!6415 thiss!1005) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005))))))

(assert (=> d!82928 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6415 thiss!1005) (bvsub nBits!297 from!289)) lt!386046)))

(declare-fun bs!21020 () Bool)

(assert (= bs!21020 d!82928))

(assert (=> bs!21020 m!373425))

(declare-fun m!373449 () Bool)

(assert (=> bs!21020 m!373449))

(assert (=> b!247766 d!82928))

(declare-fun b!247795 () Bool)

(declare-fun e!171688 () Unit!17980)

(declare-fun Unit!17982 () Unit!17980)

(assert (=> b!247795 (= e!171688 Unit!17982)))

(declare-fun lt!386160 () tuple2!21250)

(declare-fun b!247796 () Bool)

(declare-fun e!171689 () Bool)

(declare-fun lt!386157 () (_ BitVec 64))

(declare-fun lt!386147 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10784 (_ BitVec 64)) BitStream!10784)

(assert (=> b!247796 (= e!171689 (= (_1!11547 lt!386160) (withMovedBitIndex!0 (_2!11547 lt!386160) (bvsub lt!386157 lt!386147))))))

(assert (=> b!247796 (or (= (bvand lt!386157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386147 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386157 lt!386147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!247796 (= lt!386147 (bitIndex!0 (size!5931 (buf!6415 thiss!1005)) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005)))))

(assert (=> b!247796 (= lt!386157 (bitIndex!0 (size!5931 (buf!6415 thiss!1005)) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005)))))

(declare-fun d!82930 () Bool)

(assert (=> d!82930 e!171689))

(declare-fun res!207364 () Bool)

(assert (=> d!82930 (=> (not res!207364) (not e!171689))))

(assert (=> d!82930 (= res!207364 (isPrefixOf!0 (_1!11547 lt!386160) (_2!11547 lt!386160)))))

(declare-fun lt!386155 () BitStream!10784)

(assert (=> d!82930 (= lt!386160 (tuple2!21251 lt!386155 thiss!1005))))

(declare-fun lt!386163 () Unit!17980)

(declare-fun lt!386159 () Unit!17980)

(assert (=> d!82930 (= lt!386163 lt!386159)))

(assert (=> d!82930 (isPrefixOf!0 lt!386155 thiss!1005)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10784 BitStream!10784 BitStream!10784) Unit!17980)

(assert (=> d!82930 (= lt!386159 (lemmaIsPrefixTransitive!0 lt!386155 thiss!1005 thiss!1005))))

(declare-fun lt!386150 () Unit!17980)

(declare-fun lt!386152 () Unit!17980)

(assert (=> d!82930 (= lt!386150 lt!386152)))

(assert (=> d!82930 (isPrefixOf!0 lt!386155 thiss!1005)))

(assert (=> d!82930 (= lt!386152 (lemmaIsPrefixTransitive!0 lt!386155 thiss!1005 thiss!1005))))

(declare-fun lt!386149 () Unit!17980)

(assert (=> d!82930 (= lt!386149 e!171688)))

(declare-fun c!11518 () Bool)

(assert (=> d!82930 (= c!11518 (not (= (size!5931 (buf!6415 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!386165 () Unit!17980)

(declare-fun lt!386153 () Unit!17980)

(assert (=> d!82930 (= lt!386165 lt!386153)))

(assert (=> d!82930 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82930 (= lt!386153 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!386162 () Unit!17980)

(declare-fun lt!386158 () Unit!17980)

(assert (=> d!82930 (= lt!386162 lt!386158)))

(assert (=> d!82930 (= lt!386158 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun lt!386151 () Unit!17980)

(declare-fun lt!386148 () Unit!17980)

(assert (=> d!82930 (= lt!386151 lt!386148)))

(assert (=> d!82930 (isPrefixOf!0 lt!386155 lt!386155)))

(assert (=> d!82930 (= lt!386148 (lemmaIsPrefixRefl!0 lt!386155))))

(declare-fun lt!386164 () Unit!17980)

(declare-fun lt!386156 () Unit!17980)

(assert (=> d!82930 (= lt!386164 lt!386156)))

(assert (=> d!82930 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82930 (= lt!386156 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!82930 (= lt!386155 (BitStream!10785 (buf!6415 thiss!1005) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005)))))

(assert (=> d!82930 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!82930 (= (reader!0 thiss!1005 thiss!1005) lt!386160)))

(declare-fun b!247797 () Bool)

(declare-fun res!207366 () Bool)

(assert (=> b!247797 (=> (not res!207366) (not e!171689))))

(assert (=> b!247797 (= res!207366 (isPrefixOf!0 (_2!11547 lt!386160) thiss!1005))))

(declare-fun b!247798 () Bool)

(declare-fun res!207365 () Bool)

(assert (=> b!247798 (=> (not res!207365) (not e!171689))))

(assert (=> b!247798 (= res!207365 (isPrefixOf!0 (_1!11547 lt!386160) thiss!1005))))

(declare-fun b!247799 () Bool)

(declare-fun lt!386161 () Unit!17980)

(assert (=> b!247799 (= e!171688 lt!386161)))

(declare-fun lt!386166 () (_ BitVec 64))

(assert (=> b!247799 (= lt!386166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!386154 () (_ BitVec 64))

(assert (=> b!247799 (= lt!386154 (bitIndex!0 (size!5931 (buf!6415 thiss!1005)) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13526 array!13526 (_ BitVec 64) (_ BitVec 64)) Unit!17980)

(assert (=> b!247799 (= lt!386161 (arrayBitRangesEqSymmetric!0 (buf!6415 thiss!1005) (buf!6415 thiss!1005) lt!386166 lt!386154))))

(declare-fun arrayBitRangesEq!0 (array!13526 array!13526 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247799 (arrayBitRangesEq!0 (buf!6415 thiss!1005) (buf!6415 thiss!1005) lt!386166 lt!386154)))

(assert (= (and d!82930 c!11518) b!247799))

(assert (= (and d!82930 (not c!11518)) b!247795))

(assert (= (and d!82930 res!207364) b!247798))

(assert (= (and b!247798 res!207365) b!247797))

(assert (= (and b!247797 res!207366) b!247796))

(assert (=> d!82930 m!373429))

(declare-fun m!373473 () Bool)

(assert (=> d!82930 m!373473))

(declare-fun m!373475 () Bool)

(assert (=> d!82930 m!373475))

(assert (=> d!82930 m!373475))

(assert (=> d!82930 m!373429))

(assert (=> d!82930 m!373427))

(declare-fun m!373477 () Bool)

(assert (=> d!82930 m!373477))

(declare-fun m!373479 () Bool)

(assert (=> d!82930 m!373479))

(assert (=> d!82930 m!373427))

(declare-fun m!373481 () Bool)

(assert (=> d!82930 m!373481))

(assert (=> d!82930 m!373427))

(assert (=> b!247799 m!373439))

(declare-fun m!373483 () Bool)

(assert (=> b!247799 m!373483))

(declare-fun m!373485 () Bool)

(assert (=> b!247799 m!373485))

(declare-fun m!373487 () Bool)

(assert (=> b!247796 m!373487))

(assert (=> b!247796 m!373439))

(assert (=> b!247796 m!373439))

(declare-fun m!373489 () Bool)

(assert (=> b!247798 m!373489))

(declare-fun m!373491 () Bool)

(assert (=> b!247797 m!373491))

(assert (=> b!247766 d!82930))

(declare-fun d!82936 () Bool)

(assert (=> d!82936 (= (array_inv!5672 (buf!6415 thiss!1005)) (bvsge (size!5931 (buf!6415 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!247767 d!82936))

(declare-fun d!82938 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!82938 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11823 thiss!1005) (currentByte!11828 thiss!1005) (size!5931 (buf!6415 thiss!1005))))))

(declare-fun bs!21022 () Bool)

(assert (= bs!21022 d!82938))

(declare-fun m!373493 () Bool)

(assert (=> bs!21022 m!373493))

(assert (=> start!53356 d!82938))

(declare-fun d!82940 () Bool)

(declare-fun e!171697 () Bool)

(assert (=> d!82940 e!171697))

(declare-fun res!207382 () Bool)

(assert (=> d!82940 (=> (not res!207382) (not e!171697))))

(declare-fun lt!386211 () (_ BitVec 64))

(declare-fun lt!386212 () (_ BitVec 64))

(declare-fun lt!386209 () (_ BitVec 64))

(assert (=> d!82940 (= res!207382 (= lt!386209 (bvsub lt!386212 lt!386211)))))

(assert (=> d!82940 (or (= (bvand lt!386212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!386211 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!386212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!386212 lt!386211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!82940 (= lt!386211 (remainingBits!0 ((_ sign_extend 32) (size!5931 (buf!6415 thiss!1005))) ((_ sign_extend 32) (currentByte!11828 thiss!1005)) ((_ sign_extend 32) (currentBit!11823 thiss!1005))))))

(declare-fun lt!386210 () (_ BitVec 64))

(declare-fun lt!386213 () (_ BitVec 64))

(assert (=> d!82940 (= lt!386212 (bvmul lt!386210 lt!386213))))

(assert (=> d!82940 (or (= lt!386210 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!386213 (bvsdiv (bvmul lt!386210 lt!386213) lt!386210)))))

(assert (=> d!82940 (= lt!386213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!82940 (= lt!386210 ((_ sign_extend 32) (size!5931 (buf!6415 thiss!1005))))))

(assert (=> d!82940 (= lt!386209 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11828 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11823 thiss!1005))))))

(assert (=> d!82940 (invariant!0 (currentBit!11823 thiss!1005) (currentByte!11828 thiss!1005) (size!5931 (buf!6415 thiss!1005)))))

(assert (=> d!82940 (= (bitIndex!0 (size!5931 (buf!6415 thiss!1005)) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005)) lt!386209)))

(declare-fun b!247814 () Bool)

(declare-fun res!207381 () Bool)

(assert (=> b!247814 (=> (not res!207381) (not e!171697))))

(assert (=> b!247814 (= res!207381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!386209))))

(declare-fun b!247815 () Bool)

(declare-fun lt!386214 () (_ BitVec 64))

(assert (=> b!247815 (= e!171697 (bvsle lt!386209 (bvmul lt!386214 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!247815 (or (= lt!386214 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!386214 #b0000000000000000000000000000000000000000000000000000000000001000) lt!386214)))))

(assert (=> b!247815 (= lt!386214 ((_ sign_extend 32) (size!5931 (buf!6415 thiss!1005))))))

(assert (= (and d!82940 res!207382) b!247814))

(assert (= (and b!247814 res!207381) b!247815))

(declare-fun m!373497 () Bool)

(assert (=> d!82940 m!373497))

(assert (=> d!82940 m!373493))

(assert (=> b!247764 d!82940))

(declare-fun d!82950 () Bool)

(assert (=> d!82950 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5931 (buf!6415 thiss!1005))) ((_ sign_extend 32) (currentByte!11828 thiss!1005)) ((_ sign_extend 32) (currentBit!11823 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5931 (buf!6415 thiss!1005))) ((_ sign_extend 32) (currentByte!11828 thiss!1005)) ((_ sign_extend 32) (currentBit!11823 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21024 () Bool)

(assert (= bs!21024 d!82950))

(assert (=> bs!21024 m!373497))

(assert (=> b!247769 d!82950))

(declare-fun d!82952 () Bool)

(declare-fun res!207407 () Bool)

(declare-fun e!171713 () Bool)

(assert (=> d!82952 (=> (not res!207407) (not e!171713))))

(assert (=> d!82952 (= res!207407 (= (size!5931 (buf!6415 thiss!1005)) (size!5931 (buf!6415 thiss!1005))))))

(assert (=> d!82952 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!171713)))

(declare-fun b!247839 () Bool)

(declare-fun res!207406 () Bool)

(assert (=> b!247839 (=> (not res!207406) (not e!171713))))

(assert (=> b!247839 (= res!207406 (bvsle (bitIndex!0 (size!5931 (buf!6415 thiss!1005)) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005)) (bitIndex!0 (size!5931 (buf!6415 thiss!1005)) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005))))))

(declare-fun b!247840 () Bool)

(declare-fun e!171714 () Bool)

(assert (=> b!247840 (= e!171713 e!171714)))

(declare-fun res!207408 () Bool)

(assert (=> b!247840 (=> res!207408 e!171714)))

(assert (=> b!247840 (= res!207408 (= (size!5931 (buf!6415 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247841 () Bool)

(assert (=> b!247841 (= e!171714 (arrayBitRangesEq!0 (buf!6415 thiss!1005) (buf!6415 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5931 (buf!6415 thiss!1005)) (currentByte!11828 thiss!1005) (currentBit!11823 thiss!1005))))))

(assert (= (and d!82952 res!207407) b!247839))

(assert (= (and b!247839 res!207406) b!247840))

(assert (= (and b!247840 (not res!207408)) b!247841))

(assert (=> b!247839 m!373439))

(assert (=> b!247839 m!373439))

(assert (=> b!247841 m!373439))

(assert (=> b!247841 m!373439))

(declare-fun m!373507 () Bool)

(assert (=> b!247841 m!373507))

(assert (=> b!247765 d!82952))

(declare-fun d!82958 () Bool)

(assert (=> d!82958 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!386226 () Unit!17980)

(declare-fun choose!11 (BitStream!10784) Unit!17980)

(assert (=> d!82958 (= lt!386226 (choose!11 thiss!1005))))

(assert (=> d!82958 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!386226)))

(declare-fun bs!21028 () Bool)

(assert (= bs!21028 d!82958))

(assert (=> bs!21028 m!373427))

(declare-fun m!373511 () Bool)

(assert (=> bs!21028 m!373511))

(assert (=> b!247765 d!82958))

(push 1)

(assert (not d!82958))

(assert (not d!82930))

(assert (not b!247839))

(assert (not d!82950))

(assert (not d!82926))

(assert (not b!247796))

(assert (not b!247841))

(assert (not b!247799))

(assert (not d!82938))

(assert (not d!82928))

(assert (not d!82940))

(assert (not b!247797))

(assert (not b!247798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

