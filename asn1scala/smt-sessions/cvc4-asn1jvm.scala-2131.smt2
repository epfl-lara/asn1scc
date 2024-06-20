; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54070 () Bool)

(assert start!54070)

(declare-fun b!251746 () Bool)

(declare-fun e!174440 () Bool)

(declare-datatypes ((array!13694 0))(
  ( (array!13695 (arr!6993 (Array (_ BitVec 32) (_ BitVec 8))) (size!6006 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10934 0))(
  ( (BitStream!10935 (buf!6508 array!13694) (currentByte!11963 (_ BitVec 32)) (currentBit!11958 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10934)

(declare-datatypes ((Unit!18160 0))(
  ( (Unit!18161) )
))
(declare-datatypes ((tuple2!21606 0))(
  ( (tuple2!21607 (_1!11731 Unit!18160) (_2!11731 BitStream!10934)) )
))
(declare-fun lt!391151 () tuple2!21606)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251746 (= e!174440 (invariant!0 (currentBit!11958 thiss!1005) (currentByte!11963 thiss!1005) (size!6006 (buf!6508 (_2!11731 lt!391151)))))))

(declare-fun b!251747 () Bool)

(declare-fun e!174436 () Bool)

(declare-datatypes ((tuple2!21608 0))(
  ( (tuple2!21609 (_1!11732 BitStream!10934) (_2!11732 Bool)) )
))
(declare-fun lt!391148 () tuple2!21608)

(declare-datatypes ((tuple2!21610 0))(
  ( (tuple2!21611 (_1!11733 BitStream!10934) (_2!11733 BitStream!10934)) )
))
(declare-fun lt!391143 () tuple2!21610)

(assert (=> b!251747 (= e!174436 (not (or (not (_2!11732 lt!391148)) (not (= (_1!11732 lt!391148) (_2!11733 lt!391143))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10934 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21608)

(assert (=> b!251747 (= lt!391148 (checkBitsLoopPure!0 (_1!11733 lt!391143) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!391144 () tuple2!21606)

(declare-fun lt!391149 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251747 (validate_offset_bits!1 ((_ sign_extend 32) (size!6006 (buf!6508 (_2!11731 lt!391151)))) ((_ sign_extend 32) (currentByte!11963 (_2!11731 lt!391144))) ((_ sign_extend 32) (currentBit!11958 (_2!11731 lt!391144))) lt!391149)))

(declare-fun lt!391155 () Unit!18160)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10934 array!13694 (_ BitVec 64)) Unit!18160)

(assert (=> b!251747 (= lt!391155 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11731 lt!391144) (buf!6508 (_2!11731 lt!391151)) lt!391149))))

(declare-fun reader!0 (BitStream!10934 BitStream!10934) tuple2!21610)

(assert (=> b!251747 (= lt!391143 (reader!0 (_2!11731 lt!391144) (_2!11731 lt!391151)))))

(declare-fun b!251748 () Bool)

(declare-fun e!174435 () Bool)

(declare-fun e!174434 () Bool)

(assert (=> b!251748 (= e!174435 e!174434)))

(declare-fun res!210857 () Bool)

(assert (=> b!251748 (=> (not res!210857) (not e!174434))))

(declare-fun lt!391142 () tuple2!21608)

(assert (=> b!251748 (= res!210857 (and (= (_2!11732 lt!391142) bit!26) (= (_1!11732 lt!391142) (_2!11731 lt!391144))))))

(declare-fun readBitPure!0 (BitStream!10934) tuple2!21608)

(declare-fun readerFrom!0 (BitStream!10934 (_ BitVec 32) (_ BitVec 32)) BitStream!10934)

(assert (=> b!251748 (= lt!391142 (readBitPure!0 (readerFrom!0 (_2!11731 lt!391144) (currentBit!11958 thiss!1005) (currentByte!11963 thiss!1005))))))

(declare-fun res!210858 () Bool)

(declare-fun e!174431 () Bool)

(assert (=> start!54070 (=> (not res!210858) (not e!174431))))

(assert (=> start!54070 (= res!210858 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54070 e!174431))

(assert (=> start!54070 true))

(declare-fun e!174439 () Bool)

(declare-fun inv!12 (BitStream!10934) Bool)

(assert (=> start!54070 (and (inv!12 thiss!1005) e!174439)))

(declare-fun b!251749 () Bool)

(declare-fun res!210852 () Bool)

(assert (=> b!251749 (=> (not res!210852) (not e!174435))))

(declare-fun isPrefixOf!0 (BitStream!10934 BitStream!10934) Bool)

(assert (=> b!251749 (= res!210852 (isPrefixOf!0 thiss!1005 (_2!11731 lt!391144)))))

(declare-fun b!251750 () Bool)

(assert (=> b!251750 (= e!174431 (not true))))

(declare-fun lt!391141 () tuple2!21610)

(assert (=> b!251750 (= (_2!11732 (readBitPure!0 (_1!11733 lt!391141))) bit!26)))

(declare-fun lt!391145 () tuple2!21610)

(assert (=> b!251750 (= lt!391145 (reader!0 (_2!11731 lt!391144) (_2!11731 lt!391151)))))

(assert (=> b!251750 (= lt!391141 (reader!0 thiss!1005 (_2!11731 lt!391151)))))

(declare-fun e!174433 () Bool)

(assert (=> b!251750 e!174433))

(declare-fun res!210854 () Bool)

(assert (=> b!251750 (=> (not res!210854) (not e!174433))))

(declare-fun lt!391147 () tuple2!21608)

(declare-fun lt!391154 () tuple2!21608)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251750 (= res!210854 (= (bitIndex!0 (size!6006 (buf!6508 (_1!11732 lt!391147))) (currentByte!11963 (_1!11732 lt!391147)) (currentBit!11958 (_1!11732 lt!391147))) (bitIndex!0 (size!6006 (buf!6508 (_1!11732 lt!391154))) (currentByte!11963 (_1!11732 lt!391154)) (currentBit!11958 (_1!11732 lt!391154)))))))

(declare-fun lt!391140 () Unit!18160)

(declare-fun lt!391139 () BitStream!10934)

(declare-fun readBitPrefixLemma!0 (BitStream!10934 BitStream!10934) Unit!18160)

(assert (=> b!251750 (= lt!391140 (readBitPrefixLemma!0 lt!391139 (_2!11731 lt!391151)))))

(assert (=> b!251750 (= lt!391154 (readBitPure!0 (BitStream!10935 (buf!6508 (_2!11731 lt!391151)) (currentByte!11963 thiss!1005) (currentBit!11958 thiss!1005))))))

(assert (=> b!251750 (= lt!391147 (readBitPure!0 lt!391139))))

(assert (=> b!251750 (= lt!391139 (BitStream!10935 (buf!6508 (_2!11731 lt!391144)) (currentByte!11963 thiss!1005) (currentBit!11958 thiss!1005)))))

(assert (=> b!251750 e!174440))

(declare-fun res!210849 () Bool)

(assert (=> b!251750 (=> (not res!210849) (not e!174440))))

(assert (=> b!251750 (= res!210849 (isPrefixOf!0 thiss!1005 (_2!11731 lt!391151)))))

(declare-fun lt!391152 () Unit!18160)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10934 BitStream!10934 BitStream!10934) Unit!18160)

(assert (=> b!251750 (= lt!391152 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11731 lt!391144) (_2!11731 lt!391151)))))

(declare-fun e!174437 () Bool)

(assert (=> b!251750 e!174437))

(declare-fun res!210860 () Bool)

(assert (=> b!251750 (=> (not res!210860) (not e!174437))))

(assert (=> b!251750 (= res!210860 (= (size!6006 (buf!6508 (_2!11731 lt!391144))) (size!6006 (buf!6508 (_2!11731 lt!391151)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10934 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21606)

(assert (=> b!251750 (= lt!391151 (appendNBitsLoop!0 (_2!11731 lt!391144) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251750 (validate_offset_bits!1 ((_ sign_extend 32) (size!6006 (buf!6508 (_2!11731 lt!391144)))) ((_ sign_extend 32) (currentByte!11963 (_2!11731 lt!391144))) ((_ sign_extend 32) (currentBit!11958 (_2!11731 lt!391144))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391150 () Unit!18160)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10934 BitStream!10934 (_ BitVec 64) (_ BitVec 64)) Unit!18160)

(assert (=> b!251750 (= lt!391150 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11731 lt!391144) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174438 () Bool)

(assert (=> b!251750 e!174438))

(declare-fun res!210851 () Bool)

(assert (=> b!251750 (=> (not res!210851) (not e!174438))))

(assert (=> b!251750 (= res!210851 (= (size!6006 (buf!6508 thiss!1005)) (size!6006 (buf!6508 (_2!11731 lt!391144)))))))

(declare-fun appendBit!0 (BitStream!10934 Bool) tuple2!21606)

(assert (=> b!251750 (= lt!391144 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251751 () Bool)

(declare-fun res!210856 () Bool)

(assert (=> b!251751 (=> (not res!210856) (not e!174431))))

(assert (=> b!251751 (= res!210856 (bvslt from!289 nBits!297))))

(declare-fun b!251752 () Bool)

(declare-fun res!210853 () Bool)

(assert (=> b!251752 (=> (not res!210853) (not e!174431))))

(assert (=> b!251752 (= res!210853 (validate_offset_bits!1 ((_ sign_extend 32) (size!6006 (buf!6508 thiss!1005))) ((_ sign_extend 32) (currentByte!11963 thiss!1005)) ((_ sign_extend 32) (currentBit!11958 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251753 () Bool)

(declare-fun res!210859 () Bool)

(assert (=> b!251753 (=> (not res!210859) (not e!174440))))

(assert (=> b!251753 (= res!210859 (invariant!0 (currentBit!11958 thiss!1005) (currentByte!11963 thiss!1005) (size!6006 (buf!6508 (_2!11731 lt!391144)))))))

(declare-fun b!251754 () Bool)

(declare-fun array_inv!5747 (array!13694) Bool)

(assert (=> b!251754 (= e!174439 (array_inv!5747 (buf!6508 thiss!1005)))))

(declare-fun b!251755 () Bool)

(declare-fun lt!391153 () (_ BitVec 64))

(assert (=> b!251755 (= e!174434 (= (bitIndex!0 (size!6006 (buf!6508 (_1!11732 lt!391142))) (currentByte!11963 (_1!11732 lt!391142)) (currentBit!11958 (_1!11732 lt!391142))) lt!391153))))

(declare-fun b!251756 () Bool)

(declare-fun res!210850 () Bool)

(assert (=> b!251756 (=> (not res!210850) (not e!174436))))

(assert (=> b!251756 (= res!210850 (isPrefixOf!0 (_2!11731 lt!391144) (_2!11731 lt!391151)))))

(declare-fun b!251757 () Bool)

(assert (=> b!251757 (= e!174433 (= (_2!11732 lt!391147) (_2!11732 lt!391154)))))

(declare-fun b!251758 () Bool)

(assert (=> b!251758 (= e!174438 e!174435)))

(declare-fun res!210861 () Bool)

(assert (=> b!251758 (=> (not res!210861) (not e!174435))))

(declare-fun lt!391146 () (_ BitVec 64))

(assert (=> b!251758 (= res!210861 (= lt!391153 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391146)))))

(assert (=> b!251758 (= lt!391153 (bitIndex!0 (size!6006 (buf!6508 (_2!11731 lt!391144))) (currentByte!11963 (_2!11731 lt!391144)) (currentBit!11958 (_2!11731 lt!391144))))))

(assert (=> b!251758 (= lt!391146 (bitIndex!0 (size!6006 (buf!6508 thiss!1005)) (currentByte!11963 thiss!1005) (currentBit!11958 thiss!1005)))))

(declare-fun b!251759 () Bool)

(assert (=> b!251759 (= e!174437 e!174436)))

(declare-fun res!210855 () Bool)

(assert (=> b!251759 (=> (not res!210855) (not e!174436))))

(assert (=> b!251759 (= res!210855 (= (bitIndex!0 (size!6006 (buf!6508 (_2!11731 lt!391151))) (currentByte!11963 (_2!11731 lt!391151)) (currentBit!11958 (_2!11731 lt!391151))) (bvadd (bitIndex!0 (size!6006 (buf!6508 (_2!11731 lt!391144))) (currentByte!11963 (_2!11731 lt!391144)) (currentBit!11958 (_2!11731 lt!391144))) lt!391149)))))

(assert (=> b!251759 (= lt!391149 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!54070 res!210858) b!251752))

(assert (= (and b!251752 res!210853) b!251751))

(assert (= (and b!251751 res!210856) b!251750))

(assert (= (and b!251750 res!210851) b!251758))

(assert (= (and b!251758 res!210861) b!251749))

(assert (= (and b!251749 res!210852) b!251748))

(assert (= (and b!251748 res!210857) b!251755))

(assert (= (and b!251750 res!210860) b!251759))

(assert (= (and b!251759 res!210855) b!251756))

(assert (= (and b!251756 res!210850) b!251747))

(assert (= (and b!251750 res!210849) b!251753))

(assert (= (and b!251753 res!210859) b!251746))

(assert (= (and b!251750 res!210854) b!251757))

(assert (= start!54070 b!251754))

(declare-fun m!378747 () Bool)

(assert (=> b!251756 m!378747))

(declare-fun m!378749 () Bool)

(assert (=> start!54070 m!378749))

(declare-fun m!378751 () Bool)

(assert (=> b!251749 m!378751))

(declare-fun m!378753 () Bool)

(assert (=> b!251747 m!378753))

(declare-fun m!378755 () Bool)

(assert (=> b!251747 m!378755))

(declare-fun m!378757 () Bool)

(assert (=> b!251747 m!378757))

(declare-fun m!378759 () Bool)

(assert (=> b!251747 m!378759))

(declare-fun m!378761 () Bool)

(assert (=> b!251752 m!378761))

(declare-fun m!378763 () Bool)

(assert (=> b!251750 m!378763))

(declare-fun m!378765 () Bool)

(assert (=> b!251750 m!378765))

(declare-fun m!378767 () Bool)

(assert (=> b!251750 m!378767))

(declare-fun m!378769 () Bool)

(assert (=> b!251750 m!378769))

(declare-fun m!378771 () Bool)

(assert (=> b!251750 m!378771))

(declare-fun m!378773 () Bool)

(assert (=> b!251750 m!378773))

(declare-fun m!378775 () Bool)

(assert (=> b!251750 m!378775))

(declare-fun m!378777 () Bool)

(assert (=> b!251750 m!378777))

(declare-fun m!378779 () Bool)

(assert (=> b!251750 m!378779))

(declare-fun m!378781 () Bool)

(assert (=> b!251750 m!378781))

(declare-fun m!378783 () Bool)

(assert (=> b!251750 m!378783))

(declare-fun m!378785 () Bool)

(assert (=> b!251750 m!378785))

(assert (=> b!251750 m!378759))

(declare-fun m!378787 () Bool)

(assert (=> b!251750 m!378787))

(declare-fun m!378789 () Bool)

(assert (=> b!251759 m!378789))

(declare-fun m!378791 () Bool)

(assert (=> b!251759 m!378791))

(declare-fun m!378793 () Bool)

(assert (=> b!251753 m!378793))

(declare-fun m!378795 () Bool)

(assert (=> b!251746 m!378795))

(declare-fun m!378797 () Bool)

(assert (=> b!251754 m!378797))

(assert (=> b!251758 m!378791))

(declare-fun m!378799 () Bool)

(assert (=> b!251758 m!378799))

(declare-fun m!378801 () Bool)

(assert (=> b!251748 m!378801))

(assert (=> b!251748 m!378801))

(declare-fun m!378803 () Bool)

(assert (=> b!251748 m!378803))

(declare-fun m!378805 () Bool)

(assert (=> b!251755 m!378805))

(push 1)

(assert (not b!251748))

(assert (not start!54070))

(assert (not b!251755))

(assert (not b!251759))

(assert (not b!251747))

(assert (not b!251756))

(assert (not b!251749))

(assert (not b!251752))

(assert (not b!251753))

(assert (not b!251750))

(assert (not b!251746))

(assert (not b!251754))

(assert (not b!251758))

(check-sat)

