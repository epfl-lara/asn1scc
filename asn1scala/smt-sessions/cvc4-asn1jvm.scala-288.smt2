; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5712 () Bool)

(assert start!5712)

(declare-fun b!24588 () Bool)

(declare-fun res!21234 () Bool)

(declare-fun e!16775 () Bool)

(assert (=> b!24588 (=> (not res!21234) (not e!16775))))

(declare-datatypes ((array!1635 0))(
  ( (array!1636 (arr!1159 (Array (_ BitVec 32) (_ BitVec 8))) (size!703 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1238 0))(
  ( (BitStream!1239 (buf!1024 array!1635) (currentByte!2337 (_ BitVec 32)) (currentBit!2332 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1238)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24588 (= res!21234 (validate_offset_bits!1 ((_ sign_extend 32) (size!703 (buf!1024 thiss!1379))) ((_ sign_extend 32) (currentByte!2337 thiss!1379)) ((_ sign_extend 32) (currentBit!2332 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24589 () Bool)

(declare-fun res!21229 () Bool)

(declare-fun e!16774 () Bool)

(assert (=> b!24589 (=> res!21229 e!16774)))

(declare-datatypes ((Unit!2049 0))(
  ( (Unit!2050) )
))
(declare-datatypes ((tuple2!2794 0))(
  ( (tuple2!2795 (_1!1484 Unit!2049) (_2!1484 BitStream!1238)) )
))
(declare-fun lt!35075 () tuple2!2794)

(assert (=> b!24589 (= res!21229 (not (= (size!703 (buf!1024 thiss!1379)) (size!703 (buf!1024 (_2!1484 lt!35075))))))))

(declare-fun srcBuffer!2 () array!1635)

(declare-fun e!16776 () Bool)

(declare-fun b!24590 () Bool)

(declare-fun lt!35071 () tuple2!2794)

(declare-datatypes ((tuple2!2796 0))(
  ( (tuple2!2797 (_1!1485 BitStream!1238) (_2!1485 BitStream!1238)) )
))
(declare-fun lt!35070 () tuple2!2796)

(declare-datatypes ((List!320 0))(
  ( (Nil!317) (Cons!316 (h!435 Bool) (t!1070 List!320)) )
))
(declare-fun head!157 (List!320) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1238 array!1635 (_ BitVec 64) (_ BitVec 64)) List!320)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1238 BitStream!1238 (_ BitVec 64)) List!320)

(assert (=> b!24590 (= e!16776 (= (head!157 (byteArrayBitContentToList!0 (_2!1484 lt!35071) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!157 (bitStreamReadBitsIntoList!0 (_2!1484 lt!35071) (_1!1485 lt!35070) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24591 () Bool)

(declare-fun e!16779 () Bool)

(assert (=> b!24591 (= e!16779 e!16774)))

(declare-fun res!21228 () Bool)

(assert (=> b!24591 (=> res!21228 e!16774)))

(declare-fun lt!35065 () (_ BitVec 64))

(declare-fun lt!35072 () (_ BitVec 64))

(assert (=> b!24591 (= res!21228 (not (= lt!35072 (bvsub (bvadd lt!35065 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24591 (= lt!35072 (bitIndex!0 (size!703 (buf!1024 (_2!1484 lt!35075))) (currentByte!2337 (_2!1484 lt!35075)) (currentBit!2332 (_2!1484 lt!35075))))))

(declare-fun b!24592 () Bool)

(declare-fun res!21232 () Bool)

(assert (=> b!24592 (=> res!21232 e!16774)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24592 (= res!21232 (not (invariant!0 (currentBit!2332 (_2!1484 lt!35075)) (currentByte!2337 (_2!1484 lt!35075)) (size!703 (buf!1024 (_2!1484 lt!35075))))))))

(declare-fun b!24593 () Bool)

(declare-fun res!21231 () Bool)

(declare-fun e!16780 () Bool)

(assert (=> b!24593 (=> res!21231 e!16780)))

(assert (=> b!24593 (= res!21231 (not (invariant!0 (currentBit!2332 (_2!1484 lt!35071)) (currentByte!2337 (_2!1484 lt!35071)) (size!703 (buf!1024 (_2!1484 lt!35075))))))))

(declare-fun b!24594 () Bool)

(declare-fun e!16771 () Bool)

(declare-fun e!16770 () Bool)

(assert (=> b!24594 (= e!16771 e!16770)))

(declare-fun res!21236 () Bool)

(assert (=> b!24594 (=> res!21236 e!16770)))

(declare-fun isPrefixOf!0 (BitStream!1238 BitStream!1238) Bool)

(assert (=> b!24594 (= res!21236 (not (isPrefixOf!0 thiss!1379 (_2!1484 lt!35071))))))

(declare-fun lt!35074 () (_ BitVec 64))

(assert (=> b!24594 (validate_offset_bits!1 ((_ sign_extend 32) (size!703 (buf!1024 (_2!1484 lt!35071)))) ((_ sign_extend 32) (currentByte!2337 (_2!1484 lt!35071))) ((_ sign_extend 32) (currentBit!2332 (_2!1484 lt!35071))) lt!35074)))

(assert (=> b!24594 (= lt!35074 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35077 () Unit!2049)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1238 BitStream!1238 (_ BitVec 64) (_ BitVec 64)) Unit!2049)

(assert (=> b!24594 (= lt!35077 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1484 lt!35071) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1238 (_ BitVec 8) (_ BitVec 32)) tuple2!2794)

(assert (=> b!24594 (= lt!35071 (appendBitFromByte!0 thiss!1379 (select (arr!1159 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!21239 () Bool)

(assert (=> start!5712 (=> (not res!21239) (not e!16775))))

(assert (=> start!5712 (= res!21239 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!703 srcBuffer!2))))))))

(assert (=> start!5712 e!16775))

(assert (=> start!5712 true))

(declare-fun array_inv!672 (array!1635) Bool)

(assert (=> start!5712 (array_inv!672 srcBuffer!2)))

(declare-fun e!16772 () Bool)

(declare-fun inv!12 (BitStream!1238) Bool)

(assert (=> start!5712 (and (inv!12 thiss!1379) e!16772)))

(declare-fun b!24595 () Bool)

(assert (=> b!24595 (= e!16772 (array_inv!672 (buf!1024 thiss!1379)))))

(declare-fun b!24596 () Bool)

(assert (=> b!24596 (= e!16774 e!16780)))

(declare-fun res!21237 () Bool)

(assert (=> b!24596 (=> res!21237 e!16780)))

(assert (=> b!24596 (= res!21237 (not (= (size!703 (buf!1024 (_2!1484 lt!35071))) (size!703 (buf!1024 (_2!1484 lt!35075))))))))

(declare-fun e!16778 () Bool)

(assert (=> b!24596 e!16778))

(declare-fun res!21230 () Bool)

(assert (=> b!24596 (=> (not res!21230) (not e!16778))))

(assert (=> b!24596 (= res!21230 (= (size!703 (buf!1024 (_2!1484 lt!35075))) (size!703 (buf!1024 thiss!1379))))))

(declare-fun b!24597 () Bool)

(assert (=> b!24597 (= e!16780 true)))

(assert (=> b!24597 (validate_offset_bits!1 ((_ sign_extend 32) (size!703 (buf!1024 (_2!1484 lt!35075)))) ((_ sign_extend 32) (currentByte!2337 (_2!1484 lt!35071))) ((_ sign_extend 32) (currentBit!2332 (_2!1484 lt!35071))) lt!35074)))

(declare-fun lt!35066 () Unit!2049)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1238 array!1635 (_ BitVec 64)) Unit!2049)

(assert (=> b!24597 (= lt!35066 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1484 lt!35071) (buf!1024 (_2!1484 lt!35075)) lt!35074))))

(declare-fun lt!35069 () tuple2!2796)

(declare-fun reader!0 (BitStream!1238 BitStream!1238) tuple2!2796)

(assert (=> b!24597 (= lt!35069 (reader!0 (_2!1484 lt!35071) (_2!1484 lt!35075)))))

(assert (=> b!24597 (validate_offset_bits!1 ((_ sign_extend 32) (size!703 (buf!1024 (_2!1484 lt!35075)))) ((_ sign_extend 32) (currentByte!2337 thiss!1379)) ((_ sign_extend 32) (currentBit!2332 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35067 () Unit!2049)

(assert (=> b!24597 (= lt!35067 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1024 (_2!1484 lt!35075)) (bvsub to!314 i!635)))))

(declare-fun lt!35068 () tuple2!2796)

(assert (=> b!24597 (= lt!35068 (reader!0 thiss!1379 (_2!1484 lt!35075)))))

(declare-fun b!24598 () Bool)

(assert (=> b!24598 (= e!16778 (= lt!35072 (bvsub (bvsub (bvadd (bitIndex!0 (size!703 (buf!1024 (_2!1484 lt!35071))) (currentByte!2337 (_2!1484 lt!35071)) (currentBit!2332 (_2!1484 lt!35071))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24599 () Bool)

(assert (=> b!24599 (= e!16770 e!16779)))

(declare-fun res!21240 () Bool)

(assert (=> b!24599 (=> res!21240 e!16779)))

(assert (=> b!24599 (= res!21240 (not (isPrefixOf!0 (_2!1484 lt!35071) (_2!1484 lt!35075))))))

(assert (=> b!24599 (isPrefixOf!0 thiss!1379 (_2!1484 lt!35075))))

(declare-fun lt!35076 () Unit!2049)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1238 BitStream!1238 BitStream!1238) Unit!2049)

(assert (=> b!24599 (= lt!35076 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1484 lt!35071) (_2!1484 lt!35075)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1238 array!1635 (_ BitVec 64) (_ BitVec 64)) tuple2!2794)

(assert (=> b!24599 (= lt!35075 (appendBitsMSBFirstLoop!0 (_2!1484 lt!35071) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24599 e!16776))

(declare-fun res!21235 () Bool)

(assert (=> b!24599 (=> (not res!21235) (not e!16776))))

(assert (=> b!24599 (= res!21235 (validate_offset_bits!1 ((_ sign_extend 32) (size!703 (buf!1024 (_2!1484 lt!35071)))) ((_ sign_extend 32) (currentByte!2337 thiss!1379)) ((_ sign_extend 32) (currentBit!2332 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35073 () Unit!2049)

(assert (=> b!24599 (= lt!35073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1024 (_2!1484 lt!35071)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24599 (= lt!35070 (reader!0 thiss!1379 (_2!1484 lt!35071)))))

(declare-fun b!24600 () Bool)

(declare-fun res!21233 () Bool)

(assert (=> b!24600 (=> res!21233 e!16780)))

(assert (=> b!24600 (= res!21233 (not (invariant!0 (currentBit!2332 (_2!1484 lt!35071)) (currentByte!2337 (_2!1484 lt!35071)) (size!703 (buf!1024 (_2!1484 lt!35071))))))))

(declare-fun b!24601 () Bool)

(assert (=> b!24601 (= e!16775 (not e!16771))))

(declare-fun res!21238 () Bool)

(assert (=> b!24601 (=> res!21238 e!16771)))

(assert (=> b!24601 (= res!21238 (bvsge i!635 to!314))))

(assert (=> b!24601 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35064 () Unit!2049)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1238) Unit!2049)

(assert (=> b!24601 (= lt!35064 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24601 (= lt!35065 (bitIndex!0 (size!703 (buf!1024 thiss!1379)) (currentByte!2337 thiss!1379) (currentBit!2332 thiss!1379)))))

(assert (= (and start!5712 res!21239) b!24588))

(assert (= (and b!24588 res!21234) b!24601))

(assert (= (and b!24601 (not res!21238)) b!24594))

(assert (= (and b!24594 (not res!21236)) b!24599))

(assert (= (and b!24599 res!21235) b!24590))

(assert (= (and b!24599 (not res!21240)) b!24591))

(assert (= (and b!24591 (not res!21228)) b!24592))

(assert (= (and b!24592 (not res!21232)) b!24589))

(assert (= (and b!24589 (not res!21229)) b!24596))

(assert (= (and b!24596 res!21230) b!24598))

(assert (= (and b!24596 (not res!21237)) b!24600))

(assert (= (and b!24600 (not res!21233)) b!24593))

(assert (= (and b!24593 (not res!21231)) b!24597))

(assert (= start!5712 b!24595))

(declare-fun m!34753 () Bool)

(assert (=> b!24598 m!34753))

(declare-fun m!34755 () Bool)

(assert (=> b!24601 m!34755))

(declare-fun m!34757 () Bool)

(assert (=> b!24601 m!34757))

(declare-fun m!34759 () Bool)

(assert (=> b!24601 m!34759))

(declare-fun m!34761 () Bool)

(assert (=> b!24595 m!34761))

(declare-fun m!34763 () Bool)

(assert (=> b!24594 m!34763))

(declare-fun m!34765 () Bool)

(assert (=> b!24594 m!34765))

(assert (=> b!24594 m!34763))

(declare-fun m!34767 () Bool)

(assert (=> b!24594 m!34767))

(declare-fun m!34769 () Bool)

(assert (=> b!24594 m!34769))

(declare-fun m!34771 () Bool)

(assert (=> b!24594 m!34771))

(declare-fun m!34773 () Bool)

(assert (=> b!24591 m!34773))

(declare-fun m!34775 () Bool)

(assert (=> b!24597 m!34775))

(declare-fun m!34777 () Bool)

(assert (=> b!24597 m!34777))

(declare-fun m!34779 () Bool)

(assert (=> b!24597 m!34779))

(declare-fun m!34781 () Bool)

(assert (=> b!24597 m!34781))

(declare-fun m!34783 () Bool)

(assert (=> b!24597 m!34783))

(declare-fun m!34785 () Bool)

(assert (=> b!24597 m!34785))

(declare-fun m!34787 () Bool)

(assert (=> b!24593 m!34787))

(declare-fun m!34789 () Bool)

(assert (=> b!24599 m!34789))

(declare-fun m!34791 () Bool)

(assert (=> b!24599 m!34791))

(declare-fun m!34793 () Bool)

(assert (=> b!24599 m!34793))

(declare-fun m!34795 () Bool)

(assert (=> b!24599 m!34795))

(declare-fun m!34797 () Bool)

(assert (=> b!24599 m!34797))

(declare-fun m!34799 () Bool)

(assert (=> b!24599 m!34799))

(declare-fun m!34801 () Bool)

(assert (=> b!24599 m!34801))

(declare-fun m!34803 () Bool)

(assert (=> b!24588 m!34803))

(declare-fun m!34805 () Bool)

(assert (=> start!5712 m!34805))

(declare-fun m!34807 () Bool)

(assert (=> start!5712 m!34807))

(declare-fun m!34809 () Bool)

(assert (=> b!24592 m!34809))

(declare-fun m!34811 () Bool)

(assert (=> b!24590 m!34811))

(assert (=> b!24590 m!34811))

(declare-fun m!34813 () Bool)

(assert (=> b!24590 m!34813))

(declare-fun m!34815 () Bool)

(assert (=> b!24590 m!34815))

(assert (=> b!24590 m!34815))

(declare-fun m!34817 () Bool)

(assert (=> b!24590 m!34817))

(declare-fun m!34819 () Bool)

(assert (=> b!24600 m!34819))

(push 1)

(assert (not b!24601))

(assert (not b!24600))

(assert (not b!24594))

(assert (not b!24598))

(assert (not start!5712))

(assert (not b!24595))

(assert (not b!24591))

(assert (not b!24597))

(assert (not b!24590))

(assert (not b!24599))

(assert (not b!24592))

(assert (not b!24588))

(assert (not b!24593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

