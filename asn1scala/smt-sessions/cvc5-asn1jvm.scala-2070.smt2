; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52478 () Bool)

(assert start!52478)

(declare-fun b!242053 () Bool)

(declare-fun e!167809 () Bool)

(declare-fun e!167810 () Bool)

(assert (=> b!242053 (= e!167809 e!167810)))

(declare-fun res!202108 () Bool)

(assert (=> b!242053 (=> (not res!202108) (not e!167810))))

(declare-datatypes ((array!13289 0))(
  ( (array!13290 (arr!6811 (Array (_ BitVec 32) (_ BitVec 8))) (size!5824 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10570 0))(
  ( (BitStream!10571 (buf!6290 array!13289) (currentByte!11653 (_ BitVec 32)) (currentBit!11648 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17731 0))(
  ( (Unit!17732) )
))
(declare-datatypes ((tuple2!20694 0))(
  ( (tuple2!20695 (_1!11269 Unit!17731) (_2!11269 BitStream!10570)) )
))
(declare-fun lt!377475 () tuple2!20694)

(declare-fun lt!377477 () (_ BitVec 64))

(declare-fun lt!377483 () tuple2!20694)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242053 (= res!202108 (= (bitIndex!0 (size!5824 (buf!6290 (_2!11269 lt!377475))) (currentByte!11653 (_2!11269 lt!377475)) (currentBit!11648 (_2!11269 lt!377475))) (bvadd (bitIndex!0 (size!5824 (buf!6290 (_2!11269 lt!377483))) (currentByte!11653 (_2!11269 lt!377483)) (currentBit!11648 (_2!11269 lt!377483))) lt!377477)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!242053 (= lt!377477 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242054 () Bool)

(declare-fun e!167802 () Bool)

(declare-fun thiss!1005 () BitStream!10570)

(declare-fun array_inv!5565 (array!13289) Bool)

(assert (=> b!242054 (= e!167802 (array_inv!5565 (buf!6290 thiss!1005)))))

(declare-fun b!242055 () Bool)

(declare-fun res!202101 () Bool)

(declare-fun e!167805 () Bool)

(assert (=> b!242055 (=> (not res!202101) (not e!167805))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242055 (= res!202101 (validate_offset_bits!1 ((_ sign_extend 32) (size!5824 (buf!6290 thiss!1005))) ((_ sign_extend 32) (currentByte!11653 thiss!1005)) ((_ sign_extend 32) (currentBit!11648 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242056 () Bool)

(declare-fun e!167808 () Bool)

(declare-datatypes ((tuple2!20696 0))(
  ( (tuple2!20697 (_1!11270 BitStream!10570) (_2!11270 Bool)) )
))
(declare-fun lt!377476 () tuple2!20696)

(declare-fun lt!377480 () (_ BitVec 64))

(assert (=> b!242056 (= e!167808 (= (bitIndex!0 (size!5824 (buf!6290 (_1!11270 lt!377476))) (currentByte!11653 (_1!11270 lt!377476)) (currentBit!11648 (_1!11270 lt!377476))) lt!377480))))

(declare-fun b!242057 () Bool)

(declare-fun res!202110 () Bool)

(assert (=> b!242057 (=> (not res!202110) (not e!167805))))

(assert (=> b!242057 (= res!202110 (bvslt from!289 nBits!297))))

(declare-fun b!242058 () Bool)

(declare-fun e!167803 () Bool)

(assert (=> b!242058 (= e!167805 (not e!167803))))

(declare-fun res!202102 () Bool)

(assert (=> b!242058 (=> res!202102 e!167803)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242058 (= res!202102 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5824 (buf!6290 (_2!11269 lt!377483)))) ((_ sign_extend 32) (currentByte!11653 thiss!1005)) ((_ sign_extend 32) (currentBit!11648 thiss!1005)))))))

(declare-fun e!167807 () Bool)

(assert (=> b!242058 e!167807))

(declare-fun res!202104 () Bool)

(assert (=> b!242058 (=> (not res!202104) (not e!167807))))

(declare-fun isPrefixOf!0 (BitStream!10570 BitStream!10570) Bool)

(assert (=> b!242058 (= res!202104 (isPrefixOf!0 thiss!1005 (_2!11269 lt!377475)))))

(declare-fun lt!377487 () Unit!17731)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10570 BitStream!10570 BitStream!10570) Unit!17731)

(assert (=> b!242058 (= lt!377487 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11269 lt!377483) (_2!11269 lt!377475)))))

(assert (=> b!242058 e!167809))

(declare-fun res!202113 () Bool)

(assert (=> b!242058 (=> (not res!202113) (not e!167809))))

(assert (=> b!242058 (= res!202113 (= (size!5824 (buf!6290 (_2!11269 lt!377483))) (size!5824 (buf!6290 (_2!11269 lt!377475)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10570 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20694)

(assert (=> b!242058 (= lt!377475 (appendNBitsLoop!0 (_2!11269 lt!377483) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242058 (validate_offset_bits!1 ((_ sign_extend 32) (size!5824 (buf!6290 (_2!11269 lt!377483)))) ((_ sign_extend 32) (currentByte!11653 (_2!11269 lt!377483))) ((_ sign_extend 32) (currentBit!11648 (_2!11269 lt!377483))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377482 () Unit!17731)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10570 BitStream!10570 (_ BitVec 64) (_ BitVec 64)) Unit!17731)

(assert (=> b!242058 (= lt!377482 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11269 lt!377483) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167801 () Bool)

(assert (=> b!242058 e!167801))

(declare-fun res!202112 () Bool)

(assert (=> b!242058 (=> (not res!202112) (not e!167801))))

(assert (=> b!242058 (= res!202112 (= (size!5824 (buf!6290 thiss!1005)) (size!5824 (buf!6290 (_2!11269 lt!377483)))))))

(declare-fun appendBit!0 (BitStream!10570 Bool) tuple2!20694)

(assert (=> b!242058 (= lt!377483 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242059 () Bool)

(assert (=> b!242059 (= e!167803 true)))

(declare-fun lt!377479 () tuple2!20696)

(declare-fun readBitPure!0 (BitStream!10570) tuple2!20696)

(assert (=> b!242059 (= lt!377479 (readBitPure!0 (BitStream!10571 (buf!6290 (_2!11269 lt!377475)) (currentByte!11653 thiss!1005) (currentBit!11648 thiss!1005))))))

(declare-fun lt!377484 () tuple2!20696)

(assert (=> b!242059 (= lt!377484 (readBitPure!0 (BitStream!10571 (buf!6290 (_2!11269 lt!377483)) (currentByte!11653 thiss!1005) (currentBit!11648 thiss!1005))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242059 (invariant!0 (currentBit!11648 thiss!1005) (currentByte!11653 thiss!1005) (size!5824 (buf!6290 (_2!11269 lt!377475))))))

(declare-fun b!242060 () Bool)

(declare-fun res!202107 () Bool)

(assert (=> b!242060 (=> (not res!202107) (not e!167810))))

(assert (=> b!242060 (= res!202107 (isPrefixOf!0 (_2!11269 lt!377483) (_2!11269 lt!377475)))))

(declare-fun b!242061 () Bool)

(declare-fun e!167806 () Bool)

(assert (=> b!242061 (= e!167801 e!167806)))

(declare-fun res!202103 () Bool)

(assert (=> b!242061 (=> (not res!202103) (not e!167806))))

(declare-fun lt!377478 () (_ BitVec 64))

(assert (=> b!242061 (= res!202103 (= lt!377480 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377478)))))

(assert (=> b!242061 (= lt!377480 (bitIndex!0 (size!5824 (buf!6290 (_2!11269 lt!377483))) (currentByte!11653 (_2!11269 lt!377483)) (currentBit!11648 (_2!11269 lt!377483))))))

(assert (=> b!242061 (= lt!377478 (bitIndex!0 (size!5824 (buf!6290 thiss!1005)) (currentByte!11653 thiss!1005) (currentBit!11648 thiss!1005)))))

(declare-fun b!242062 () Bool)

(assert (=> b!242062 (= e!167806 e!167808)))

(declare-fun res!202111 () Bool)

(assert (=> b!242062 (=> (not res!202111) (not e!167808))))

(assert (=> b!242062 (= res!202111 (and (= (_2!11270 lt!377476) bit!26) (= (_1!11270 lt!377476) (_2!11269 lt!377483))))))

(declare-fun readerFrom!0 (BitStream!10570 (_ BitVec 32) (_ BitVec 32)) BitStream!10570)

(assert (=> b!242062 (= lt!377476 (readBitPure!0 (readerFrom!0 (_2!11269 lt!377483) (currentBit!11648 thiss!1005) (currentByte!11653 thiss!1005))))))

(declare-fun b!242063 () Bool)

(declare-fun res!202105 () Bool)

(assert (=> b!242063 (=> res!202105 e!167803)))

(declare-fun arrayBitRangesEq!0 (array!13289 array!13289 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242063 (= res!202105 (not (arrayBitRangesEq!0 (buf!6290 (_2!11269 lt!377483)) (buf!6290 (_2!11269 lt!377475)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5824 (buf!6290 (_2!11269 lt!377483))) (currentByte!11653 thiss!1005) (currentBit!11648 thiss!1005))))))))

(declare-fun b!242064 () Bool)

(declare-fun lt!377485 () tuple2!20696)

(declare-datatypes ((tuple2!20698 0))(
  ( (tuple2!20699 (_1!11271 BitStream!10570) (_2!11271 BitStream!10570)) )
))
(declare-fun lt!377481 () tuple2!20698)

(assert (=> b!242064 (= e!167810 (not (or (not (_2!11270 lt!377485)) (not (= (_1!11270 lt!377485) (_2!11271 lt!377481))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10570 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20696)

(assert (=> b!242064 (= lt!377485 (checkBitsLoopPure!0 (_1!11271 lt!377481) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242064 (validate_offset_bits!1 ((_ sign_extend 32) (size!5824 (buf!6290 (_2!11269 lt!377475)))) ((_ sign_extend 32) (currentByte!11653 (_2!11269 lt!377483))) ((_ sign_extend 32) (currentBit!11648 (_2!11269 lt!377483))) lt!377477)))

(declare-fun lt!377486 () Unit!17731)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10570 array!13289 (_ BitVec 64)) Unit!17731)

(assert (=> b!242064 (= lt!377486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11269 lt!377483) (buf!6290 (_2!11269 lt!377475)) lt!377477))))

(declare-fun reader!0 (BitStream!10570 BitStream!10570) tuple2!20698)

(assert (=> b!242064 (= lt!377481 (reader!0 (_2!11269 lt!377483) (_2!11269 lt!377475)))))

(declare-fun b!242065 () Bool)

(assert (=> b!242065 (= e!167807 (invariant!0 (currentBit!11648 thiss!1005) (currentByte!11653 thiss!1005) (size!5824 (buf!6290 (_2!11269 lt!377483)))))))

(declare-fun res!202109 () Bool)

(assert (=> start!52478 (=> (not res!202109) (not e!167805))))

(assert (=> start!52478 (= res!202109 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52478 e!167805))

(assert (=> start!52478 true))

(declare-fun inv!12 (BitStream!10570) Bool)

(assert (=> start!52478 (and (inv!12 thiss!1005) e!167802)))

(declare-fun b!242066 () Bool)

(declare-fun res!202106 () Bool)

(assert (=> b!242066 (=> (not res!202106) (not e!167806))))

(assert (=> b!242066 (= res!202106 (isPrefixOf!0 thiss!1005 (_2!11269 lt!377483)))))

(assert (= (and start!52478 res!202109) b!242055))

(assert (= (and b!242055 res!202101) b!242057))

(assert (= (and b!242057 res!202110) b!242058))

(assert (= (and b!242058 res!202112) b!242061))

(assert (= (and b!242061 res!202103) b!242066))

(assert (= (and b!242066 res!202106) b!242062))

(assert (= (and b!242062 res!202111) b!242056))

(assert (= (and b!242058 res!202113) b!242053))

(assert (= (and b!242053 res!202108) b!242060))

(assert (= (and b!242060 res!202107) b!242064))

(assert (= (and b!242058 res!202104) b!242065))

(assert (= (and b!242058 (not res!202102)) b!242063))

(assert (= (and b!242063 (not res!202105)) b!242059))

(assert (= start!52478 b!242054))

(declare-fun m!364763 () Bool)

(assert (=> b!242062 m!364763))

(assert (=> b!242062 m!364763))

(declare-fun m!364765 () Bool)

(assert (=> b!242062 m!364765))

(declare-fun m!364767 () Bool)

(assert (=> start!52478 m!364767))

(declare-fun m!364769 () Bool)

(assert (=> b!242059 m!364769))

(declare-fun m!364771 () Bool)

(assert (=> b!242059 m!364771))

(declare-fun m!364773 () Bool)

(assert (=> b!242059 m!364773))

(declare-fun m!364775 () Bool)

(assert (=> b!242065 m!364775))

(declare-fun m!364777 () Bool)

(assert (=> b!242064 m!364777))

(declare-fun m!364779 () Bool)

(assert (=> b!242064 m!364779))

(declare-fun m!364781 () Bool)

(assert (=> b!242064 m!364781))

(declare-fun m!364783 () Bool)

(assert (=> b!242064 m!364783))

(declare-fun m!364785 () Bool)

(assert (=> b!242055 m!364785))

(declare-fun m!364787 () Bool)

(assert (=> b!242063 m!364787))

(declare-fun m!364789 () Bool)

(assert (=> b!242063 m!364789))

(declare-fun m!364791 () Bool)

(assert (=> b!242066 m!364791))

(declare-fun m!364793 () Bool)

(assert (=> b!242061 m!364793))

(declare-fun m!364795 () Bool)

(assert (=> b!242061 m!364795))

(declare-fun m!364797 () Bool)

(assert (=> b!242053 m!364797))

(assert (=> b!242053 m!364793))

(declare-fun m!364799 () Bool)

(assert (=> b!242058 m!364799))

(declare-fun m!364801 () Bool)

(assert (=> b!242058 m!364801))

(declare-fun m!364803 () Bool)

(assert (=> b!242058 m!364803))

(declare-fun m!364805 () Bool)

(assert (=> b!242058 m!364805))

(declare-fun m!364807 () Bool)

(assert (=> b!242058 m!364807))

(declare-fun m!364809 () Bool)

(assert (=> b!242058 m!364809))

(declare-fun m!364811 () Bool)

(assert (=> b!242058 m!364811))

(declare-fun m!364813 () Bool)

(assert (=> b!242056 m!364813))

(declare-fun m!364815 () Bool)

(assert (=> b!242054 m!364815))

(declare-fun m!364817 () Bool)

(assert (=> b!242060 m!364817))

(push 1)

(assert (not b!242063))

(assert (not start!52478))

(assert (not b!242058))

(assert (not b!242059))

(assert (not b!242062))

(assert (not b!242064))

(assert (not b!242066))

(assert (not b!242060))

(assert (not b!242065))

(assert (not b!242056))

(assert (not b!242055))

(assert (not b!242053))

(assert (not b!242061))

(assert (not b!242054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

