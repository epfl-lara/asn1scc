; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54112 () Bool)

(assert start!54112)

(declare-fun b!252628 () Bool)

(declare-fun res!211677 () Bool)

(declare-fun e!175061 () Bool)

(assert (=> b!252628 (=> (not res!211677) (not e!175061))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!252628 (= res!211677 (bvslt from!289 nBits!297))))

(declare-fun b!252629 () Bool)

(declare-fun e!175062 () Bool)

(declare-datatypes ((array!13736 0))(
  ( (array!13737 (arr!7014 (Array (_ BitVec 32) (_ BitVec 8))) (size!6027 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10976 0))(
  ( (BitStream!10977 (buf!6529 array!13736) (currentByte!11984 (_ BitVec 32)) (currentBit!11979 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10976)

(declare-datatypes ((Unit!18202 0))(
  ( (Unit!18203) )
))
(declare-datatypes ((tuple2!21732 0))(
  ( (tuple2!21733 (_1!11794 Unit!18202) (_2!11794 BitStream!10976)) )
))
(declare-fun lt!392360 () tuple2!21732)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252629 (= e!175062 (invariant!0 (currentBit!11979 thiss!1005) (currentByte!11984 thiss!1005) (size!6027 (buf!6529 (_2!11794 lt!392360)))))))

(declare-fun b!252630 () Bool)

(declare-fun e!175069 () Bool)

(declare-datatypes ((tuple2!21734 0))(
  ( (tuple2!21735 (_1!11795 BitStream!10976) (_2!11795 Bool)) )
))
(declare-fun lt!392351 () tuple2!21734)

(declare-fun lt!392370 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252630 (= e!175069 (= (bitIndex!0 (size!6027 (buf!6529 (_1!11795 lt!392351))) (currentByte!11984 (_1!11795 lt!392351)) (currentBit!11979 (_1!11795 lt!392351))) lt!392370))))

(declare-fun b!252631 () Bool)

(declare-fun res!211678 () Bool)

(assert (=> b!252631 (=> (not res!211678) (not e!175062))))

(declare-fun lt!392364 () tuple2!21732)

(assert (=> b!252631 (= res!211678 (invariant!0 (currentBit!11979 thiss!1005) (currentByte!11984 thiss!1005) (size!6027 (buf!6529 (_2!11794 lt!392364)))))))

(declare-fun b!252632 () Bool)

(declare-fun e!175065 () Bool)

(declare-fun e!175068 () Bool)

(assert (=> b!252632 (= e!175065 e!175068)))

(declare-fun res!211675 () Bool)

(assert (=> b!252632 (=> (not res!211675) (not e!175068))))

(declare-fun lt!392367 () (_ BitVec 64))

(assert (=> b!252632 (= res!211675 (= (bitIndex!0 (size!6027 (buf!6529 (_2!11794 lt!392360))) (currentByte!11984 (_2!11794 lt!392360)) (currentBit!11979 (_2!11794 lt!392360))) (bvadd (bitIndex!0 (size!6027 (buf!6529 (_2!11794 lt!392364))) (currentByte!11984 (_2!11794 lt!392364)) (currentBit!11979 (_2!11794 lt!392364))) lt!392367)))))

(assert (=> b!252632 (= lt!392367 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252633 () Bool)

(declare-fun lt!392361 () tuple2!21734)

(declare-datatypes ((tuple2!21736 0))(
  ( (tuple2!21737 (_1!11796 BitStream!10976) (_2!11796 BitStream!10976)) )
))
(declare-fun lt!392363 () tuple2!21736)

(assert (=> b!252633 (= e!175068 (not (or (not (_2!11795 lt!392361)) (not (= (_1!11795 lt!392361) (_2!11796 lt!392363))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10976 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21734)

(assert (=> b!252633 (= lt!392361 (checkBitsLoopPure!0 (_1!11796 lt!392363) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252633 (validate_offset_bits!1 ((_ sign_extend 32) (size!6027 (buf!6529 (_2!11794 lt!392360)))) ((_ sign_extend 32) (currentByte!11984 (_2!11794 lt!392364))) ((_ sign_extend 32) (currentBit!11979 (_2!11794 lt!392364))) lt!392367)))

(declare-fun lt!392352 () Unit!18202)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10976 array!13736 (_ BitVec 64)) Unit!18202)

(assert (=> b!252633 (= lt!392352 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11794 lt!392364) (buf!6529 (_2!11794 lt!392360)) lt!392367))))

(declare-fun reader!0 (BitStream!10976 BitStream!10976) tuple2!21736)

(assert (=> b!252633 (= lt!392363 (reader!0 (_2!11794 lt!392364) (_2!11794 lt!392360)))))

(declare-fun b!252634 () Bool)

(declare-fun res!211676 () Bool)

(assert (=> b!252634 (=> (not res!211676) (not e!175061))))

(assert (=> b!252634 (= res!211676 (validate_offset_bits!1 ((_ sign_extend 32) (size!6027 (buf!6529 thiss!1005))) ((_ sign_extend 32) (currentByte!11984 thiss!1005)) ((_ sign_extend 32) (currentBit!11979 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252635 () Bool)

(declare-fun res!211673 () Bool)

(assert (=> b!252635 (=> (not res!211673) (not e!175068))))

(declare-fun isPrefixOf!0 (BitStream!10976 BitStream!10976) Bool)

(assert (=> b!252635 (= res!211673 (isPrefixOf!0 (_2!11794 lt!392364) (_2!11794 lt!392360)))))

(declare-fun b!252636 () Bool)

(declare-fun e!175067 () Bool)

(declare-fun lt!392368 () tuple2!21734)

(declare-fun lt!392358 () tuple2!21734)

(assert (=> b!252636 (= e!175067 (= (_2!11795 lt!392368) (_2!11795 lt!392358)))))

(declare-fun b!252637 () Bool)

(declare-fun res!211668 () Bool)

(declare-fun e!175064 () Bool)

(assert (=> b!252637 (=> (not res!211668) (not e!175064))))

(assert (=> b!252637 (= res!211668 (isPrefixOf!0 thiss!1005 (_2!11794 lt!392364)))))

(declare-fun res!211672 () Bool)

(assert (=> start!54112 (=> (not res!211672) (not e!175061))))

(assert (=> start!54112 (= res!211672 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54112 e!175061))

(assert (=> start!54112 true))

(declare-fun e!175063 () Bool)

(declare-fun inv!12 (BitStream!10976) Bool)

(assert (=> start!54112 (and (inv!12 thiss!1005) e!175063)))

(declare-fun b!252638 () Bool)

(assert (=> b!252638 (= e!175061 (not (or (not (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!392350 () (_ BitVec 64))

(assert (=> b!252638 (validate_offset_bits!1 ((_ sign_extend 32) (size!6027 (buf!6529 (_2!11794 lt!392360)))) ((_ sign_extend 32) (currentByte!11984 (_2!11794 lt!392364))) ((_ sign_extend 32) (currentBit!11979 (_2!11794 lt!392364))) lt!392350)))

(declare-fun lt!392356 () Unit!18202)

(assert (=> b!252638 (= lt!392356 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11794 lt!392364) (buf!6529 (_2!11794 lt!392360)) lt!392350))))

(declare-fun lt!392369 () tuple2!21736)

(declare-fun lt!392365 () tuple2!21734)

(assert (=> b!252638 (= lt!392365 (checkBitsLoopPure!0 (_1!11796 lt!392369) nBits!297 bit!26 from!289))))

(assert (=> b!252638 (validate_offset_bits!1 ((_ sign_extend 32) (size!6027 (buf!6529 (_2!11794 lt!392360)))) ((_ sign_extend 32) (currentByte!11984 thiss!1005)) ((_ sign_extend 32) (currentBit!11979 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392355 () Unit!18202)

(assert (=> b!252638 (= lt!392355 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6529 (_2!11794 lt!392360)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10976) tuple2!21734)

(assert (=> b!252638 (= (_2!11795 (readBitPure!0 (_1!11796 lt!392369))) bit!26)))

(declare-fun lt!392359 () tuple2!21736)

(assert (=> b!252638 (= lt!392359 (reader!0 (_2!11794 lt!392364) (_2!11794 lt!392360)))))

(assert (=> b!252638 (= lt!392369 (reader!0 thiss!1005 (_2!11794 lt!392360)))))

(assert (=> b!252638 e!175067))

(declare-fun res!211674 () Bool)

(assert (=> b!252638 (=> (not res!211674) (not e!175067))))

(assert (=> b!252638 (= res!211674 (= (bitIndex!0 (size!6027 (buf!6529 (_1!11795 lt!392368))) (currentByte!11984 (_1!11795 lt!392368)) (currentBit!11979 (_1!11795 lt!392368))) (bitIndex!0 (size!6027 (buf!6529 (_1!11795 lt!392358))) (currentByte!11984 (_1!11795 lt!392358)) (currentBit!11979 (_1!11795 lt!392358)))))))

(declare-fun lt!392362 () Unit!18202)

(declare-fun lt!392354 () BitStream!10976)

(declare-fun readBitPrefixLemma!0 (BitStream!10976 BitStream!10976) Unit!18202)

(assert (=> b!252638 (= lt!392362 (readBitPrefixLemma!0 lt!392354 (_2!11794 lt!392360)))))

(assert (=> b!252638 (= lt!392358 (readBitPure!0 (BitStream!10977 (buf!6529 (_2!11794 lt!392360)) (currentByte!11984 thiss!1005) (currentBit!11979 thiss!1005))))))

(assert (=> b!252638 (= lt!392368 (readBitPure!0 lt!392354))))

(assert (=> b!252638 (= lt!392354 (BitStream!10977 (buf!6529 (_2!11794 lt!392364)) (currentByte!11984 thiss!1005) (currentBit!11979 thiss!1005)))))

(assert (=> b!252638 e!175062))

(declare-fun res!211679 () Bool)

(assert (=> b!252638 (=> (not res!211679) (not e!175062))))

(assert (=> b!252638 (= res!211679 (isPrefixOf!0 thiss!1005 (_2!11794 lt!392360)))))

(declare-fun lt!392357 () Unit!18202)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10976 BitStream!10976 BitStream!10976) Unit!18202)

(assert (=> b!252638 (= lt!392357 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11794 lt!392364) (_2!11794 lt!392360)))))

(assert (=> b!252638 e!175065))

(declare-fun res!211669 () Bool)

(assert (=> b!252638 (=> (not res!211669) (not e!175065))))

(assert (=> b!252638 (= res!211669 (= (size!6027 (buf!6529 (_2!11794 lt!392364))) (size!6027 (buf!6529 (_2!11794 lt!392360)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10976 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21732)

(assert (=> b!252638 (= lt!392360 (appendNBitsLoop!0 (_2!11794 lt!392364) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252638 (validate_offset_bits!1 ((_ sign_extend 32) (size!6027 (buf!6529 (_2!11794 lt!392364)))) ((_ sign_extend 32) (currentByte!11984 (_2!11794 lt!392364))) ((_ sign_extend 32) (currentBit!11979 (_2!11794 lt!392364))) lt!392350)))

(assert (=> b!252638 (= lt!392350 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392353 () Unit!18202)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10976 BitStream!10976 (_ BitVec 64) (_ BitVec 64)) Unit!18202)

(assert (=> b!252638 (= lt!392353 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11794 lt!392364) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!175066 () Bool)

(assert (=> b!252638 e!175066))

(declare-fun res!211670 () Bool)

(assert (=> b!252638 (=> (not res!211670) (not e!175066))))

(assert (=> b!252638 (= res!211670 (= (size!6027 (buf!6529 thiss!1005)) (size!6027 (buf!6529 (_2!11794 lt!392364)))))))

(declare-fun appendBit!0 (BitStream!10976 Bool) tuple2!21732)

(assert (=> b!252638 (= lt!392364 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252639 () Bool)

(declare-fun array_inv!5768 (array!13736) Bool)

(assert (=> b!252639 (= e!175063 (array_inv!5768 (buf!6529 thiss!1005)))))

(declare-fun b!252640 () Bool)

(assert (=> b!252640 (= e!175064 e!175069)))

(declare-fun res!211680 () Bool)

(assert (=> b!252640 (=> (not res!211680) (not e!175069))))

(assert (=> b!252640 (= res!211680 (and (= (_2!11795 lt!392351) bit!26) (= (_1!11795 lt!392351) (_2!11794 lt!392364))))))

(declare-fun readerFrom!0 (BitStream!10976 (_ BitVec 32) (_ BitVec 32)) BitStream!10976)

(assert (=> b!252640 (= lt!392351 (readBitPure!0 (readerFrom!0 (_2!11794 lt!392364) (currentBit!11979 thiss!1005) (currentByte!11984 thiss!1005))))))

(declare-fun b!252641 () Bool)

(assert (=> b!252641 (= e!175066 e!175064)))

(declare-fun res!211671 () Bool)

(assert (=> b!252641 (=> (not res!211671) (not e!175064))))

(declare-fun lt!392366 () (_ BitVec 64))

(assert (=> b!252641 (= res!211671 (= lt!392370 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392366)))))

(assert (=> b!252641 (= lt!392370 (bitIndex!0 (size!6027 (buf!6529 (_2!11794 lt!392364))) (currentByte!11984 (_2!11794 lt!392364)) (currentBit!11979 (_2!11794 lt!392364))))))

(assert (=> b!252641 (= lt!392366 (bitIndex!0 (size!6027 (buf!6529 thiss!1005)) (currentByte!11984 thiss!1005) (currentBit!11979 thiss!1005)))))

(assert (= (and start!54112 res!211672) b!252634))

(assert (= (and b!252634 res!211676) b!252628))

(assert (= (and b!252628 res!211677) b!252638))

(assert (= (and b!252638 res!211670) b!252641))

(assert (= (and b!252641 res!211671) b!252637))

(assert (= (and b!252637 res!211668) b!252640))

(assert (= (and b!252640 res!211680) b!252630))

(assert (= (and b!252638 res!211669) b!252632))

(assert (= (and b!252632 res!211675) b!252635))

(assert (= (and b!252635 res!211673) b!252633))

(assert (= (and b!252638 res!211679) b!252631))

(assert (= (and b!252631 res!211678) b!252629))

(assert (= (and b!252638 res!211674) b!252636))

(assert (= start!54112 b!252639))

(declare-fun m!380117 () Bool)

(assert (=> start!54112 m!380117))

(declare-fun m!380119 () Bool)

(assert (=> b!252632 m!380119))

(declare-fun m!380121 () Bool)

(assert (=> b!252632 m!380121))

(declare-fun m!380123 () Bool)

(assert (=> b!252633 m!380123))

(declare-fun m!380125 () Bool)

(assert (=> b!252633 m!380125))

(declare-fun m!380127 () Bool)

(assert (=> b!252633 m!380127))

(declare-fun m!380129 () Bool)

(assert (=> b!252633 m!380129))

(declare-fun m!380131 () Bool)

(assert (=> b!252637 m!380131))

(declare-fun m!380133 () Bool)

(assert (=> b!252629 m!380133))

(declare-fun m!380135 () Bool)

(assert (=> b!252630 m!380135))

(declare-fun m!380137 () Bool)

(assert (=> b!252638 m!380137))

(declare-fun m!380139 () Bool)

(assert (=> b!252638 m!380139))

(declare-fun m!380141 () Bool)

(assert (=> b!252638 m!380141))

(declare-fun m!380143 () Bool)

(assert (=> b!252638 m!380143))

(declare-fun m!380145 () Bool)

(assert (=> b!252638 m!380145))

(declare-fun m!380147 () Bool)

(assert (=> b!252638 m!380147))

(declare-fun m!380149 () Bool)

(assert (=> b!252638 m!380149))

(declare-fun m!380151 () Bool)

(assert (=> b!252638 m!380151))

(declare-fun m!380153 () Bool)

(assert (=> b!252638 m!380153))

(declare-fun m!380155 () Bool)

(assert (=> b!252638 m!380155))

(assert (=> b!252638 m!380129))

(declare-fun m!380157 () Bool)

(assert (=> b!252638 m!380157))

(declare-fun m!380159 () Bool)

(assert (=> b!252638 m!380159))

(declare-fun m!380161 () Bool)

(assert (=> b!252638 m!380161))

(declare-fun m!380163 () Bool)

(assert (=> b!252638 m!380163))

(declare-fun m!380165 () Bool)

(assert (=> b!252638 m!380165))

(declare-fun m!380167 () Bool)

(assert (=> b!252638 m!380167))

(declare-fun m!380169 () Bool)

(assert (=> b!252638 m!380169))

(declare-fun m!380171 () Bool)

(assert (=> b!252638 m!380171))

(declare-fun m!380173 () Bool)

(assert (=> b!252634 m!380173))

(declare-fun m!380175 () Bool)

(assert (=> b!252640 m!380175))

(assert (=> b!252640 m!380175))

(declare-fun m!380177 () Bool)

(assert (=> b!252640 m!380177))

(assert (=> b!252641 m!380121))

(declare-fun m!380179 () Bool)

(assert (=> b!252641 m!380179))

(declare-fun m!380181 () Bool)

(assert (=> b!252639 m!380181))

(declare-fun m!380183 () Bool)

(assert (=> b!252631 m!380183))

(declare-fun m!380185 () Bool)

(assert (=> b!252635 m!380185))

(push 1)

(assert (not b!252629))

(assert (not b!252634))

(assert (not b!252633))

(assert (not b!252637))

(assert (not b!252640))

(assert (not b!252631))

(assert (not b!252641))

(assert (not b!252630))

(assert (not b!252638))

(assert (not start!54112))

(assert (not b!252635))

(assert (not b!252632))

(assert (not b!252639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

