; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54628 () Bool)

(assert start!54628)

(declare-fun res!214084 () Bool)

(declare-fun e!176954 () Bool)

(assert (=> start!54628 (=> (not res!214084) (not e!176954))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!54628 (= res!214084 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54628 e!176954))

(assert (=> start!54628 true))

(declare-datatypes ((array!13775 0))(
  ( (array!13776 (arr!7029 (Array (_ BitVec 32) (_ BitVec 8))) (size!6042 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11006 0))(
  ( (BitStream!11007 (buf!6559 array!13775) (currentByte!12038 (_ BitVec 32)) (currentBit!12033 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11006)

(declare-fun e!176944 () Bool)

(declare-fun inv!12 (BitStream!11006) Bool)

(assert (=> start!54628 (and (inv!12 thiss!1005) e!176944)))

(declare-fun b!255420 () Bool)

(declare-fun res!214079 () Bool)

(declare-fun e!176949 () Bool)

(assert (=> b!255420 (=> (not res!214079) (not e!176949))))

(declare-datatypes ((Unit!18292 0))(
  ( (Unit!18293) )
))
(declare-datatypes ((tuple2!21840 0))(
  ( (tuple2!21841 (_1!11854 Unit!18292) (_2!11854 BitStream!11006)) )
))
(declare-fun lt!396725 () tuple2!21840)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255420 (= res!214079 (invariant!0 (currentBit!12033 thiss!1005) (currentByte!12038 thiss!1005) (size!6042 (buf!6559 (_2!11854 lt!396725)))))))

(declare-fun b!255421 () Bool)

(declare-fun e!176953 () Bool)

(declare-fun e!176943 () Bool)

(assert (=> b!255421 (= e!176953 e!176943)))

(declare-fun res!214091 () Bool)

(assert (=> b!255421 (=> (not res!214091) (not e!176943))))

(declare-fun lt!396722 () (_ BitVec 64))

(declare-fun lt!396728 () (_ BitVec 64))

(assert (=> b!255421 (= res!214091 (= lt!396722 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!396728)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255421 (= lt!396722 (bitIndex!0 (size!6042 (buf!6559 (_2!11854 lt!396725))) (currentByte!12038 (_2!11854 lt!396725)) (currentBit!12033 (_2!11854 lt!396725))))))

(assert (=> b!255421 (= lt!396728 (bitIndex!0 (size!6042 (buf!6559 thiss!1005)) (currentByte!12038 thiss!1005) (currentBit!12033 thiss!1005)))))

(declare-fun b!255422 () Bool)

(declare-fun e!176952 () Bool)

(assert (=> b!255422 (= e!176952 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!255423 () Bool)

(declare-fun e!176950 () Bool)

(assert (=> b!255423 (= e!176950 e!176952)))

(declare-fun res!214081 () Bool)

(assert (=> b!255423 (=> res!214081 e!176952)))

(declare-fun lt!396717 () tuple2!21840)

(assert (=> b!255423 (= res!214081 (not (= (size!6042 (buf!6559 thiss!1005)) (size!6042 (buf!6559 (_2!11854 lt!396717))))))))

(declare-datatypes ((tuple2!21842 0))(
  ( (tuple2!21843 (_1!11855 BitStream!11006) (_2!11855 Bool)) )
))
(declare-fun lt!396719 () tuple2!21842)

(declare-fun lt!396712 () tuple2!21842)

(declare-datatypes ((tuple2!21844 0))(
  ( (tuple2!21845 (_1!11856 BitStream!11006) (_2!11856 BitStream!11006)) )
))
(declare-fun lt!396721 () tuple2!21844)

(assert (=> b!255423 (and (= (_2!11855 lt!396719) (_2!11855 lt!396712)) (= (_1!11855 lt!396719) (_2!11856 lt!396721)))))

(declare-fun b!255424 () Bool)

(declare-fun res!214087 () Bool)

(assert (=> b!255424 (=> (not res!214087) (not e!176954))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255424 (= res!214087 (validate_offset_bits!1 ((_ sign_extend 32) (size!6042 (buf!6559 thiss!1005))) ((_ sign_extend 32) (currentByte!12038 thiss!1005)) ((_ sign_extend 32) (currentBit!12033 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255425 () Bool)

(declare-fun res!214092 () Bool)

(assert (=> b!255425 (=> res!214092 e!176952)))

(assert (=> b!255425 (= res!214092 (not (= (bitIndex!0 (size!6042 (buf!6559 (_2!11854 lt!396717))) (currentByte!12038 (_2!11854 lt!396717)) (currentBit!12033 (_2!11854 lt!396717))) (bvadd (bitIndex!0 (size!6042 (buf!6559 thiss!1005)) (currentByte!12038 thiss!1005) (currentBit!12033 thiss!1005)) (bvsub nBits!297 from!289)))))))

(declare-fun b!255426 () Bool)

(declare-fun e!176945 () Bool)

(declare-fun lt!396729 () tuple2!21842)

(declare-fun lt!396711 () tuple2!21844)

(assert (=> b!255426 (= e!176945 (not (or (not (_2!11855 lt!396729)) (not (= (_1!11855 lt!396729) (_2!11856 lt!396711))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11006 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21842)

(assert (=> b!255426 (= lt!396729 (checkBitsLoopPure!0 (_1!11856 lt!396711) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396724 () (_ BitVec 64))

(assert (=> b!255426 (validate_offset_bits!1 ((_ sign_extend 32) (size!6042 (buf!6559 (_2!11854 lt!396717)))) ((_ sign_extend 32) (currentByte!12038 (_2!11854 lt!396725))) ((_ sign_extend 32) (currentBit!12033 (_2!11854 lt!396725))) lt!396724)))

(declare-fun lt!396713 () Unit!18292)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11006 array!13775 (_ BitVec 64)) Unit!18292)

(assert (=> b!255426 (= lt!396713 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11854 lt!396725) (buf!6559 (_2!11854 lt!396717)) lt!396724))))

(declare-fun reader!0 (BitStream!11006 BitStream!11006) tuple2!21844)

(assert (=> b!255426 (= lt!396711 (reader!0 (_2!11854 lt!396725) (_2!11854 lt!396717)))))

(declare-fun b!255427 () Bool)

(declare-fun e!176947 () Bool)

(assert (=> b!255427 (= e!176943 e!176947)))

(declare-fun res!214094 () Bool)

(assert (=> b!255427 (=> (not res!214094) (not e!176947))))

(declare-fun lt!396726 () tuple2!21842)

(assert (=> b!255427 (= res!214094 (and (= (_2!11855 lt!396726) bit!26) (= (_1!11855 lt!396726) (_2!11854 lt!396725))))))

(declare-fun readBitPure!0 (BitStream!11006) tuple2!21842)

(declare-fun readerFrom!0 (BitStream!11006 (_ BitVec 32) (_ BitVec 32)) BitStream!11006)

(assert (=> b!255427 (= lt!396726 (readBitPure!0 (readerFrom!0 (_2!11854 lt!396725) (currentBit!12033 thiss!1005) (currentByte!12038 thiss!1005))))))

(declare-fun b!255428 () Bool)

(declare-fun res!214085 () Bool)

(assert (=> b!255428 (=> res!214085 e!176950)))

(declare-fun lt!396714 () tuple2!21844)

(declare-fun withMovedBitIndex!0 (BitStream!11006 (_ BitVec 64)) BitStream!11006)

(assert (=> b!255428 (= res!214085 (not (= (_1!11856 lt!396714) (withMovedBitIndex!0 (_1!11856 lt!396721) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255429 () Bool)

(declare-fun e!176951 () Bool)

(assert (=> b!255429 (= e!176951 e!176945)))

(declare-fun res!214095 () Bool)

(assert (=> b!255429 (=> (not res!214095) (not e!176945))))

(assert (=> b!255429 (= res!214095 (= (bitIndex!0 (size!6042 (buf!6559 (_2!11854 lt!396717))) (currentByte!12038 (_2!11854 lt!396717)) (currentBit!12033 (_2!11854 lt!396717))) (bvadd (bitIndex!0 (size!6042 (buf!6559 (_2!11854 lt!396725))) (currentByte!12038 (_2!11854 lt!396725)) (currentBit!12033 (_2!11854 lt!396725))) lt!396724)))))

(assert (=> b!255429 (= lt!396724 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255430 () Bool)

(declare-fun res!214089 () Bool)

(assert (=> b!255430 (=> (not res!214089) (not e!176945))))

(declare-fun isPrefixOf!0 (BitStream!11006 BitStream!11006) Bool)

(assert (=> b!255430 (= res!214089 (isPrefixOf!0 (_2!11854 lt!396725) (_2!11854 lt!396717)))))

(declare-fun b!255431 () Bool)

(assert (=> b!255431 (= e!176947 (= (bitIndex!0 (size!6042 (buf!6559 (_1!11855 lt!396726))) (currentByte!12038 (_1!11855 lt!396726)) (currentBit!12033 (_1!11855 lt!396726))) lt!396722))))

(declare-fun b!255432 () Bool)

(declare-fun res!214086 () Bool)

(assert (=> b!255432 (=> (not res!214086) (not e!176943))))

(assert (=> b!255432 (= res!214086 (isPrefixOf!0 thiss!1005 (_2!11854 lt!396725)))))

(declare-fun b!255433 () Bool)

(declare-fun array_inv!5783 (array!13775) Bool)

(assert (=> b!255433 (= e!176944 (array_inv!5783 (buf!6559 thiss!1005)))))

(declare-fun b!255434 () Bool)

(declare-fun res!214088 () Bool)

(assert (=> b!255434 (=> (not res!214088) (not e!176954))))

(assert (=> b!255434 (= res!214088 (bvslt from!289 nBits!297))))

(declare-fun b!255435 () Bool)

(assert (=> b!255435 (= e!176954 (not e!176950))))

(declare-fun res!214093 () Bool)

(assert (=> b!255435 (=> res!214093 e!176950)))

(assert (=> b!255435 (= res!214093 (not (= (_1!11855 lt!396712) (_2!11856 lt!396714))))))

(assert (=> b!255435 (= lt!396712 (checkBitsLoopPure!0 (_1!11856 lt!396714) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396720 () (_ BitVec 64))

(assert (=> b!255435 (validate_offset_bits!1 ((_ sign_extend 32) (size!6042 (buf!6559 (_2!11854 lt!396717)))) ((_ sign_extend 32) (currentByte!12038 (_2!11854 lt!396725))) ((_ sign_extend 32) (currentBit!12033 (_2!11854 lt!396725))) lt!396720)))

(declare-fun lt!396715 () Unit!18292)

(assert (=> b!255435 (= lt!396715 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11854 lt!396725) (buf!6559 (_2!11854 lt!396717)) lt!396720))))

(assert (=> b!255435 (= lt!396719 (checkBitsLoopPure!0 (_1!11856 lt!396721) nBits!297 bit!26 from!289))))

(assert (=> b!255435 (validate_offset_bits!1 ((_ sign_extend 32) (size!6042 (buf!6559 (_2!11854 lt!396717)))) ((_ sign_extend 32) (currentByte!12038 thiss!1005)) ((_ sign_extend 32) (currentBit!12033 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!396710 () Unit!18292)

(assert (=> b!255435 (= lt!396710 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6559 (_2!11854 lt!396717)) (bvsub nBits!297 from!289)))))

(assert (=> b!255435 (= (_2!11855 (readBitPure!0 (_1!11856 lt!396721))) bit!26)))

(assert (=> b!255435 (= lt!396714 (reader!0 (_2!11854 lt!396725) (_2!11854 lt!396717)))))

(assert (=> b!255435 (= lt!396721 (reader!0 thiss!1005 (_2!11854 lt!396717)))))

(declare-fun e!176948 () Bool)

(assert (=> b!255435 e!176948))

(declare-fun res!214080 () Bool)

(assert (=> b!255435 (=> (not res!214080) (not e!176948))))

(declare-fun lt!396727 () tuple2!21842)

(declare-fun lt!396716 () tuple2!21842)

(assert (=> b!255435 (= res!214080 (= (bitIndex!0 (size!6042 (buf!6559 (_1!11855 lt!396727))) (currentByte!12038 (_1!11855 lt!396727)) (currentBit!12033 (_1!11855 lt!396727))) (bitIndex!0 (size!6042 (buf!6559 (_1!11855 lt!396716))) (currentByte!12038 (_1!11855 lt!396716)) (currentBit!12033 (_1!11855 lt!396716)))))))

(declare-fun lt!396709 () Unit!18292)

(declare-fun lt!396718 () BitStream!11006)

(declare-fun readBitPrefixLemma!0 (BitStream!11006 BitStream!11006) Unit!18292)

(assert (=> b!255435 (= lt!396709 (readBitPrefixLemma!0 lt!396718 (_2!11854 lt!396717)))))

(assert (=> b!255435 (= lt!396716 (readBitPure!0 (BitStream!11007 (buf!6559 (_2!11854 lt!396717)) (currentByte!12038 thiss!1005) (currentBit!12033 thiss!1005))))))

(assert (=> b!255435 (= lt!396727 (readBitPure!0 lt!396718))))

(assert (=> b!255435 (= lt!396718 (BitStream!11007 (buf!6559 (_2!11854 lt!396725)) (currentByte!12038 thiss!1005) (currentBit!12033 thiss!1005)))))

(assert (=> b!255435 e!176949))

(declare-fun res!214083 () Bool)

(assert (=> b!255435 (=> (not res!214083) (not e!176949))))

(assert (=> b!255435 (= res!214083 (isPrefixOf!0 thiss!1005 (_2!11854 lt!396717)))))

(declare-fun lt!396723 () Unit!18292)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11006 BitStream!11006 BitStream!11006) Unit!18292)

(assert (=> b!255435 (= lt!396723 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11854 lt!396725) (_2!11854 lt!396717)))))

(assert (=> b!255435 e!176951))

(declare-fun res!214090 () Bool)

(assert (=> b!255435 (=> (not res!214090) (not e!176951))))

(assert (=> b!255435 (= res!214090 (= (size!6042 (buf!6559 (_2!11854 lt!396725))) (size!6042 (buf!6559 (_2!11854 lt!396717)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11006 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21840)

(assert (=> b!255435 (= lt!396717 (appendNBitsLoop!0 (_2!11854 lt!396725) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255435 (validate_offset_bits!1 ((_ sign_extend 32) (size!6042 (buf!6559 (_2!11854 lt!396725)))) ((_ sign_extend 32) (currentByte!12038 (_2!11854 lt!396725))) ((_ sign_extend 32) (currentBit!12033 (_2!11854 lt!396725))) lt!396720)))

(assert (=> b!255435 (= lt!396720 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!396708 () Unit!18292)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11006 BitStream!11006 (_ BitVec 64) (_ BitVec 64)) Unit!18292)

(assert (=> b!255435 (= lt!396708 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11854 lt!396725) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255435 e!176953))

(declare-fun res!214082 () Bool)

(assert (=> b!255435 (=> (not res!214082) (not e!176953))))

(assert (=> b!255435 (= res!214082 (= (size!6042 (buf!6559 thiss!1005)) (size!6042 (buf!6559 (_2!11854 lt!396725)))))))

(declare-fun appendBit!0 (BitStream!11006 Bool) tuple2!21840)

(assert (=> b!255435 (= lt!396725 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255436 () Bool)

(assert (=> b!255436 (= e!176949 (invariant!0 (currentBit!12033 thiss!1005) (currentByte!12038 thiss!1005) (size!6042 (buf!6559 (_2!11854 lt!396717)))))))

(declare-fun b!255437 () Bool)

(assert (=> b!255437 (= e!176948 (= (_2!11855 lt!396727) (_2!11855 lt!396716)))))

(assert (= (and start!54628 res!214084) b!255424))

(assert (= (and b!255424 res!214087) b!255434))

(assert (= (and b!255434 res!214088) b!255435))

(assert (= (and b!255435 res!214082) b!255421))

(assert (= (and b!255421 res!214091) b!255432))

(assert (= (and b!255432 res!214086) b!255427))

(assert (= (and b!255427 res!214094) b!255431))

(assert (= (and b!255435 res!214090) b!255429))

(assert (= (and b!255429 res!214095) b!255430))

(assert (= (and b!255430 res!214089) b!255426))

(assert (= (and b!255435 res!214083) b!255420))

(assert (= (and b!255420 res!214079) b!255436))

(assert (= (and b!255435 res!214080) b!255437))

(assert (= (and b!255435 (not res!214093)) b!255428))

(assert (= (and b!255428 (not res!214085)) b!255423))

(assert (= (and b!255423 (not res!214081)) b!255425))

(assert (= (and b!255425 (not res!214092)) b!255422))

(assert (= start!54628 b!255433))

(declare-fun m!384763 () Bool)

(assert (=> b!255427 m!384763))

(assert (=> b!255427 m!384763))

(declare-fun m!384765 () Bool)

(assert (=> b!255427 m!384765))

(declare-fun m!384767 () Bool)

(assert (=> b!255432 m!384767))

(declare-fun m!384769 () Bool)

(assert (=> b!255430 m!384769))

(declare-fun m!384771 () Bool)

(assert (=> b!255421 m!384771))

(declare-fun m!384773 () Bool)

(assert (=> b!255421 m!384773))

(declare-fun m!384775 () Bool)

(assert (=> b!255425 m!384775))

(assert (=> b!255425 m!384773))

(declare-fun m!384777 () Bool)

(assert (=> b!255424 m!384777))

(declare-fun m!384779 () Bool)

(assert (=> start!54628 m!384779))

(declare-fun m!384781 () Bool)

(assert (=> b!255426 m!384781))

(declare-fun m!384783 () Bool)

(assert (=> b!255426 m!384783))

(declare-fun m!384785 () Bool)

(assert (=> b!255426 m!384785))

(declare-fun m!384787 () Bool)

(assert (=> b!255426 m!384787))

(declare-fun m!384789 () Bool)

(assert (=> b!255433 m!384789))

(declare-fun m!384791 () Bool)

(assert (=> b!255435 m!384791))

(declare-fun m!384793 () Bool)

(assert (=> b!255435 m!384793))

(declare-fun m!384795 () Bool)

(assert (=> b!255435 m!384795))

(declare-fun m!384797 () Bool)

(assert (=> b!255435 m!384797))

(declare-fun m!384799 () Bool)

(assert (=> b!255435 m!384799))

(declare-fun m!384801 () Bool)

(assert (=> b!255435 m!384801))

(declare-fun m!384803 () Bool)

(assert (=> b!255435 m!384803))

(declare-fun m!384805 () Bool)

(assert (=> b!255435 m!384805))

(declare-fun m!384807 () Bool)

(assert (=> b!255435 m!384807))

(declare-fun m!384809 () Bool)

(assert (=> b!255435 m!384809))

(declare-fun m!384811 () Bool)

(assert (=> b!255435 m!384811))

(declare-fun m!384813 () Bool)

(assert (=> b!255435 m!384813))

(declare-fun m!384815 () Bool)

(assert (=> b!255435 m!384815))

(declare-fun m!384817 () Bool)

(assert (=> b!255435 m!384817))

(declare-fun m!384819 () Bool)

(assert (=> b!255435 m!384819))

(assert (=> b!255435 m!384787))

(declare-fun m!384821 () Bool)

(assert (=> b!255435 m!384821))

(declare-fun m!384823 () Bool)

(assert (=> b!255435 m!384823))

(declare-fun m!384825 () Bool)

(assert (=> b!255435 m!384825))

(declare-fun m!384827 () Bool)

(assert (=> b!255435 m!384827))

(declare-fun m!384829 () Bool)

(assert (=> b!255431 m!384829))

(declare-fun m!384831 () Bool)

(assert (=> b!255428 m!384831))

(declare-fun m!384833 () Bool)

(assert (=> b!255420 m!384833))

(assert (=> b!255429 m!384775))

(assert (=> b!255429 m!384771))

(declare-fun m!384835 () Bool)

(assert (=> b!255436 m!384835))

(push 1)

(assert (not b!255432))

(assert (not b!255428))

(assert (not b!255431))

(assert (not b!255429))

(assert (not b!255420))

(assert (not b!255436))

(assert (not start!54628))

(assert (not b!255427))

(assert (not b!255433))

(assert (not b!255426))

(assert (not b!255421))

(assert (not b!255430))

(assert (not b!255435))

(assert (not b!255424))

(assert (not b!255425))

(check-sat)

(pop 1)

(push 1)

(check-sat)

