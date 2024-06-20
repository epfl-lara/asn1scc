; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21242 () Bool)

(assert start!21242)

(declare-fun b!107104 () Bool)

(declare-fun res!88252 () Bool)

(declare-fun e!70122 () Bool)

(assert (=> b!107104 (=> (not res!88252) (not e!70122))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!107104 (= res!88252 (bvslt i!615 nBits!396))))

(declare-fun b!107105 () Bool)

(declare-fun e!70124 () Bool)

(declare-datatypes ((array!4920 0))(
  ( (array!4921 (arr!2834 (Array (_ BitVec 32) (_ BitVec 8))) (size!2241 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3956 0))(
  ( (BitStream!3957 (buf!2623 array!4920) (currentByte!5141 (_ BitVec 32)) (currentBit!5136 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3956)

(declare-datatypes ((Unit!6560 0))(
  ( (Unit!6561) )
))
(declare-datatypes ((tuple2!8828 0))(
  ( (tuple2!8829 (_1!4671 Unit!6560) (_2!4671 BitStream!3956)) )
))
(declare-fun lt!159777 () tuple2!8828)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!107105 (= e!70124 (invariant!0 (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305) (size!2241 (buf!2623 (_2!4671 lt!159777)))))))

(declare-fun b!107106 () Bool)

(declare-fun e!70125 () Bool)

(declare-datatypes ((tuple2!8830 0))(
  ( (tuple2!8831 (_1!4672 BitStream!3956) (_2!4672 Bool)) )
))
(declare-fun lt!159782 () tuple2!8830)

(declare-fun lt!159776 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107106 (= e!70125 (= (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!159782))) (currentByte!5141 (_1!4672 lt!159782)) (currentBit!5136 (_1!4672 lt!159782))) lt!159776))))

(declare-fun b!107107 () Bool)

(declare-fun e!70130 () Bool)

(assert (=> b!107107 (= e!70130 e!70125)))

(declare-fun res!88259 () Bool)

(assert (=> b!107107 (=> (not res!88259) (not e!70125))))

(declare-fun lt!159798 () tuple2!8828)

(declare-fun lt!159790 () Bool)

(assert (=> b!107107 (= res!88259 (and (= (_2!4672 lt!159782) lt!159790) (= (_1!4672 lt!159782) (_2!4671 lt!159798))))))

(declare-fun readBitPure!0 (BitStream!3956) tuple2!8830)

(declare-fun readerFrom!0 (BitStream!3956 (_ BitVec 32) (_ BitVec 32)) BitStream!3956)

(assert (=> b!107107 (= lt!159782 (readBitPure!0 (readerFrom!0 (_2!4671 lt!159798) (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305))))))

(declare-fun lt!159775 () (_ BitVec 64))

(declare-fun b!107108 () Bool)

(declare-fun e!70121 () Bool)

(declare-datatypes ((tuple2!8832 0))(
  ( (tuple2!8833 (_1!4673 BitStream!3956) (_2!4673 BitStream!3956)) )
))
(declare-fun lt!159797 () tuple2!8832)

(declare-fun withMovedBitIndex!0 (BitStream!3956 (_ BitVec 64)) BitStream!3956)

(assert (=> b!107108 (= e!70121 (= (_1!4673 lt!159797) (withMovedBitIndex!0 (_2!4673 lt!159797) (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) lt!159775))))))

(declare-fun b!107109 () Bool)

(declare-fun e!70128 () Bool)

(declare-fun lt!159773 () tuple2!8830)

(declare-fun lt!159792 () tuple2!8830)

(assert (=> b!107109 (= e!70128 (= (_2!4672 lt!159773) (_2!4672 lt!159792)))))

(declare-fun b!107110 () Bool)

(declare-fun e!70123 () Bool)

(assert (=> b!107110 (= e!70122 (not e!70123))))

(declare-fun res!88253 () Bool)

(assert (=> b!107110 (=> res!88253 e!70123)))

(declare-fun lt!159783 () (_ BitVec 64))

(declare-datatypes ((tuple2!8834 0))(
  ( (tuple2!8835 (_1!4674 BitStream!3956) (_2!4674 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8834)

(assert (=> b!107110 (= res!88253 (not (= (_1!4674 (readNLeastSignificantBitsLoopPure!0 (_1!4673 lt!159797) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159783)) (_2!4673 lt!159797))))))

(declare-fun lt!159778 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107110 (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159798))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159798))) lt!159778)))

(declare-fun lt!159780 () Unit!6560)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3956 array!4920 (_ BitVec 64)) Unit!6560)

(assert (=> b!107110 (= lt!159780 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4671 lt!159798) (buf!2623 (_2!4671 lt!159777)) lt!159778))))

(assert (=> b!107110 (= lt!159778 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!159793 () (_ BitVec 64))

(declare-fun lt!159784 () (_ BitVec 64))

(declare-fun lt!159788 () tuple2!8830)

(assert (=> b!107110 (= lt!159783 (bvor lt!159793 (ite (_2!4672 lt!159788) lt!159784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!159795 () tuple2!8834)

(declare-fun lt!159781 () tuple2!8832)

(assert (=> b!107110 (= lt!159795 (readNLeastSignificantBitsLoopPure!0 (_1!4673 lt!159781) nBits!396 i!615 lt!159793))))

(declare-fun lt!159794 () (_ BitVec 64))

(assert (=> b!107110 (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))) ((_ sign_extend 32) (currentByte!5141 thiss!1305)) ((_ sign_extend 32) (currentBit!5136 thiss!1305)) lt!159794)))

(declare-fun lt!159796 () Unit!6560)

(assert (=> b!107110 (= lt!159796 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2623 (_2!4671 lt!159777)) lt!159794))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107110 (= lt!159793 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!107110 (= (_2!4672 lt!159788) lt!159790)))

(assert (=> b!107110 (= lt!159788 (readBitPure!0 (_1!4673 lt!159781)))))

(declare-fun reader!0 (BitStream!3956 BitStream!3956) tuple2!8832)

(assert (=> b!107110 (= lt!159797 (reader!0 (_2!4671 lt!159798) (_2!4671 lt!159777)))))

(assert (=> b!107110 (= lt!159781 (reader!0 thiss!1305 (_2!4671 lt!159777)))))

(assert (=> b!107110 e!70128))

(declare-fun res!88251 () Bool)

(assert (=> b!107110 (=> (not res!88251) (not e!70128))))

(assert (=> b!107110 (= res!88251 (= (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!159773))) (currentByte!5141 (_1!4672 lt!159773)) (currentBit!5136 (_1!4672 lt!159773))) (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!159792))) (currentByte!5141 (_1!4672 lt!159792)) (currentBit!5136 (_1!4672 lt!159792)))))))

(declare-fun lt!159785 () Unit!6560)

(declare-fun lt!159774 () BitStream!3956)

(declare-fun readBitPrefixLemma!0 (BitStream!3956 BitStream!3956) Unit!6560)

(assert (=> b!107110 (= lt!159785 (readBitPrefixLemma!0 lt!159774 (_2!4671 lt!159777)))))

(assert (=> b!107110 (= lt!159792 (readBitPure!0 (BitStream!3957 (buf!2623 (_2!4671 lt!159777)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305))))))

(assert (=> b!107110 (= lt!159773 (readBitPure!0 lt!159774))))

(assert (=> b!107110 (= lt!159774 (BitStream!3957 (buf!2623 (_2!4671 lt!159798)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)))))

(assert (=> b!107110 e!70124))

(declare-fun res!88261 () Bool)

(assert (=> b!107110 (=> (not res!88261) (not e!70124))))

(declare-fun isPrefixOf!0 (BitStream!3956 BitStream!3956) Bool)

(assert (=> b!107110 (= res!88261 (isPrefixOf!0 thiss!1305 (_2!4671 lt!159777)))))

(declare-fun lt!159779 () Unit!6560)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3956 BitStream!3956 BitStream!3956) Unit!6560)

(assert (=> b!107110 (= lt!159779 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4671 lt!159798) (_2!4671 lt!159777)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3956 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8828)

(assert (=> b!107110 (= lt!159777 (appendNLeastSignificantBitsLoop!0 (_2!4671 lt!159798) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!70131 () Bool)

(assert (=> b!107110 e!70131))

(declare-fun res!88260 () Bool)

(assert (=> b!107110 (=> (not res!88260) (not e!70131))))

(assert (=> b!107110 (= res!88260 (= (size!2241 (buf!2623 thiss!1305)) (size!2241 (buf!2623 (_2!4671 lt!159798)))))))

(declare-fun appendBit!0 (BitStream!3956 Bool) tuple2!8828)

(assert (=> b!107110 (= lt!159798 (appendBit!0 thiss!1305 lt!159790))))

(assert (=> b!107110 (= lt!159790 (not (= (bvand v!199 lt!159784) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107110 (= lt!159784 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun res!88254 () Bool)

(declare-fun e!70127 () Bool)

(assert (=> start!21242 (=> (not res!88254) (not e!70127))))

(assert (=> start!21242 (= res!88254 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21242 e!70127))

(assert (=> start!21242 true))

(declare-fun e!70129 () Bool)

(declare-fun inv!12 (BitStream!3956) Bool)

(assert (=> start!21242 (and (inv!12 thiss!1305) e!70129)))

(declare-fun b!107111 () Bool)

(assert (=> b!107111 (= e!70127 e!70122)))

(declare-fun res!88256 () Bool)

(assert (=> b!107111 (=> (not res!88256) (not e!70122))))

(assert (=> b!107111 (= res!88256 (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 thiss!1305))) ((_ sign_extend 32) (currentByte!5141 thiss!1305)) ((_ sign_extend 32) (currentBit!5136 thiss!1305)) lt!159794))))

(assert (=> b!107111 (= lt!159794 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!107112 () Bool)

(declare-fun res!88262 () Bool)

(assert (=> b!107112 (=> (not res!88262) (not e!70122))))

(assert (=> b!107112 (= res!88262 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!107113 () Bool)

(assert (=> b!107113 (= e!70123 (invariant!0 (currentBit!5136 (_2!4671 lt!159798)) (currentByte!5141 (_2!4671 lt!159798)) (size!2241 (buf!2623 (_2!4671 lt!159798)))))))

(assert (=> b!107113 e!70121))

(declare-fun res!88263 () Bool)

(assert (=> b!107113 (=> (not res!88263) (not e!70121))))

(declare-fun lt!159791 () (_ BitVec 64))

(assert (=> b!107113 (= res!88263 (= (_1!4673 lt!159781) (withMovedBitIndex!0 (_2!4673 lt!159781) (bvsub lt!159791 lt!159775))))))

(assert (=> b!107113 (= lt!159775 (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159777))) (currentByte!5141 (_2!4671 lt!159777)) (currentBit!5136 (_2!4671 lt!159777))))))

(assert (=> b!107113 (= lt!159791 (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)))))

(declare-fun lt!159787 () tuple2!8834)

(assert (=> b!107113 (and (= (_2!4674 lt!159795) (_2!4674 lt!159787)) (= (_1!4674 lt!159795) (_1!4674 lt!159787)))))

(declare-fun lt!159789 () Unit!6560)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6560)

(assert (=> b!107113 (= lt!159789 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4673 lt!159781) nBits!396 i!615 lt!159793))))

(assert (=> b!107113 (= lt!159787 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4673 lt!159781) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159783))))

(declare-fun b!107114 () Bool)

(declare-fun array_inv!2043 (array!4920) Bool)

(assert (=> b!107114 (= e!70129 (array_inv!2043 (buf!2623 thiss!1305)))))

(declare-fun b!107115 () Bool)

(declare-fun res!88257 () Bool)

(assert (=> b!107115 (=> (not res!88257) (not e!70130))))

(assert (=> b!107115 (= res!88257 (isPrefixOf!0 thiss!1305 (_2!4671 lt!159798)))))

(declare-fun b!107116 () Bool)

(declare-fun res!88258 () Bool)

(assert (=> b!107116 (=> (not res!88258) (not e!70124))))

(assert (=> b!107116 (= res!88258 (invariant!0 (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305) (size!2241 (buf!2623 (_2!4671 lt!159798)))))))

(declare-fun b!107117 () Bool)

(assert (=> b!107117 (= e!70131 e!70130)))

(declare-fun res!88255 () Bool)

(assert (=> b!107117 (=> (not res!88255) (not e!70130))))

(declare-fun lt!159786 () (_ BitVec 64))

(assert (=> b!107117 (= res!88255 (= lt!159776 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!159786)))))

(assert (=> b!107117 (= lt!159776 (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))))))

(assert (=> b!107117 (= lt!159786 (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)))))

(assert (= (and start!21242 res!88254) b!107111))

(assert (= (and b!107111 res!88256) b!107112))

(assert (= (and b!107112 res!88262) b!107104))

(assert (= (and b!107104 res!88252) b!107110))

(assert (= (and b!107110 res!88260) b!107117))

(assert (= (and b!107117 res!88255) b!107115))

(assert (= (and b!107115 res!88257) b!107107))

(assert (= (and b!107107 res!88259) b!107106))

(assert (= (and b!107110 res!88261) b!107116))

(assert (= (and b!107116 res!88258) b!107105))

(assert (= (and b!107110 res!88251) b!107109))

(assert (= (and b!107110 (not res!88253)) b!107113))

(assert (= (and b!107113 res!88263) b!107108))

(assert (= start!21242 b!107114))

(declare-fun m!158051 () Bool)

(assert (=> b!107114 m!158051))

(declare-fun m!158053 () Bool)

(assert (=> b!107107 m!158053))

(assert (=> b!107107 m!158053))

(declare-fun m!158055 () Bool)

(assert (=> b!107107 m!158055))

(declare-fun m!158057 () Bool)

(assert (=> b!107108 m!158057))

(declare-fun m!158059 () Bool)

(assert (=> b!107108 m!158059))

(assert (=> b!107117 m!158057))

(declare-fun m!158061 () Bool)

(assert (=> b!107117 m!158061))

(declare-fun m!158063 () Bool)

(assert (=> b!107106 m!158063))

(declare-fun m!158065 () Bool)

(assert (=> b!107111 m!158065))

(declare-fun m!158067 () Bool)

(assert (=> start!21242 m!158067))

(declare-fun m!158069 () Bool)

(assert (=> b!107115 m!158069))

(declare-fun m!158071 () Bool)

(assert (=> b!107105 m!158071))

(declare-fun m!158073 () Bool)

(assert (=> b!107113 m!158073))

(declare-fun m!158075 () Bool)

(assert (=> b!107113 m!158075))

(declare-fun m!158077 () Bool)

(assert (=> b!107113 m!158077))

(declare-fun m!158079 () Bool)

(assert (=> b!107113 m!158079))

(assert (=> b!107113 m!158061))

(declare-fun m!158081 () Bool)

(assert (=> b!107113 m!158081))

(declare-fun m!158083 () Bool)

(assert (=> b!107113 m!158083))

(assert (=> b!107113 m!158081))

(declare-fun m!158085 () Bool)

(assert (=> b!107116 m!158085))

(declare-fun m!158087 () Bool)

(assert (=> b!107112 m!158087))

(declare-fun m!158089 () Bool)

(assert (=> b!107110 m!158089))

(declare-fun m!158091 () Bool)

(assert (=> b!107110 m!158091))

(declare-fun m!158093 () Bool)

(assert (=> b!107110 m!158093))

(declare-fun m!158095 () Bool)

(assert (=> b!107110 m!158095))

(declare-fun m!158097 () Bool)

(assert (=> b!107110 m!158097))

(declare-fun m!158099 () Bool)

(assert (=> b!107110 m!158099))

(declare-fun m!158101 () Bool)

(assert (=> b!107110 m!158101))

(declare-fun m!158103 () Bool)

(assert (=> b!107110 m!158103))

(declare-fun m!158105 () Bool)

(assert (=> b!107110 m!158105))

(declare-fun m!158107 () Bool)

(assert (=> b!107110 m!158107))

(declare-fun m!158109 () Bool)

(assert (=> b!107110 m!158109))

(declare-fun m!158111 () Bool)

(assert (=> b!107110 m!158111))

(declare-fun m!158113 () Bool)

(assert (=> b!107110 m!158113))

(declare-fun m!158115 () Bool)

(assert (=> b!107110 m!158115))

(declare-fun m!158117 () Bool)

(assert (=> b!107110 m!158117))

(declare-fun m!158119 () Bool)

(assert (=> b!107110 m!158119))

(declare-fun m!158121 () Bool)

(assert (=> b!107110 m!158121))

(declare-fun m!158123 () Bool)

(assert (=> b!107110 m!158123))

(declare-fun m!158125 () Bool)

(assert (=> b!107110 m!158125))

(push 1)

(assert (not b!107117))

(assert (not b!107111))

(assert (not b!107110))

(assert (not b!107105))

(assert (not b!107112))

(assert (not b!107115))

(assert (not b!107106))

(assert (not b!107108))

(assert (not b!107107))

(assert (not b!107113))

(assert (not b!107116))

(assert (not b!107114))

(assert (not start!21242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33742 () Bool)

(declare-datatypes ((tuple2!8842 0))(
  ( (tuple2!8843 (_1!4678 Bool) (_2!4678 BitStream!3956)) )
))
(declare-fun lt!159801 () tuple2!8842)

(declare-fun readBit!0 (BitStream!3956) tuple2!8842)

(assert (=> d!33742 (= lt!159801 (readBit!0 (readerFrom!0 (_2!4671 lt!159798) (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305))))))

(assert (=> d!33742 (= (readBitPure!0 (readerFrom!0 (_2!4671 lt!159798) (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305))) (tuple2!8831 (_2!4678 lt!159801) (_1!4678 lt!159801)))))

(declare-fun bs!8238 () Bool)

(assert (= bs!8238 d!33742))

(assert (=> bs!8238 m!158053))

(declare-fun m!158127 () Bool)

(assert (=> bs!8238 m!158127))

(assert (=> b!107107 d!33742))

(declare-fun d!33744 () Bool)

(declare-fun e!70134 () Bool)

(assert (=> d!33744 e!70134))

(declare-fun res!88267 () Bool)

(assert (=> d!33744 (=> (not res!88267) (not e!70134))))

(assert (=> d!33744 (= res!88267 (invariant!0 (currentBit!5136 (_2!4671 lt!159798)) (currentByte!5141 (_2!4671 lt!159798)) (size!2241 (buf!2623 (_2!4671 lt!159798)))))))

(assert (=> d!33744 (= (readerFrom!0 (_2!4671 lt!159798) (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305)) (BitStream!3957 (buf!2623 (_2!4671 lt!159798)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)))))

(declare-fun b!107120 () Bool)

(assert (=> b!107120 (= e!70134 (invariant!0 (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305) (size!2241 (buf!2623 (_2!4671 lt!159798)))))))

(assert (= (and d!33744 res!88267) b!107120))

(assert (=> d!33744 m!158073))

(assert (=> b!107120 m!158085))

(assert (=> b!107107 d!33744))

(declare-fun d!33746 () Bool)

(declare-fun e!70141 () Bool)

(assert (=> d!33746 e!70141))

(declare-fun res!88276 () Bool)

(assert (=> d!33746 (=> (not res!88276) (not e!70141))))

(declare-fun lt!159825 () (_ BitVec 64))

(declare-fun lt!159827 () (_ BitVec 64))

(declare-fun lt!159823 () (_ BitVec 64))

(assert (=> d!33746 (= res!88276 (= lt!159825 (bvsub lt!159823 lt!159827)))))

(assert (=> d!33746 (or (= (bvand lt!159823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159827 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159823 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159823 lt!159827) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33746 (= lt!159827 (remainingBits!0 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159798)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159798))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159798)))))))

(declare-fun lt!159822 () (_ BitVec 64))

(declare-fun lt!159826 () (_ BitVec 64))

(assert (=> d!33746 (= lt!159823 (bvmul lt!159822 lt!159826))))

(assert (=> d!33746 (or (= lt!159822 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159826 (bvsdiv (bvmul lt!159822 lt!159826) lt!159822)))))

(assert (=> d!33746 (= lt!159826 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33746 (= lt!159822 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159798)))))))

(assert (=> d!33746 (= lt!159825 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159798))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159798)))))))

(assert (=> d!33746 (invariant!0 (currentBit!5136 (_2!4671 lt!159798)) (currentByte!5141 (_2!4671 lt!159798)) (size!2241 (buf!2623 (_2!4671 lt!159798))))))

(assert (=> d!33746 (= (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) lt!159825)))

(declare-fun b!107129 () Bool)

(declare-fun res!88277 () Bool)

(assert (=> b!107129 (=> (not res!88277) (not e!70141))))

(assert (=> b!107129 (= res!88277 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159825))))

(declare-fun b!107130 () Bool)

(declare-fun lt!159824 () (_ BitVec 64))

(assert (=> b!107130 (= e!70141 (bvsle lt!159825 (bvmul lt!159824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107130 (or (= lt!159824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159824)))))

(assert (=> b!107130 (= lt!159824 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159798)))))))

(assert (= (and d!33746 res!88276) b!107129))

(assert (= (and b!107129 res!88277) b!107130))

(declare-fun m!158145 () Bool)

(assert (=> d!33746 m!158145))

(assert (=> d!33746 m!158073))

(assert (=> b!107117 d!33746))

(declare-fun d!33756 () Bool)

(declare-fun e!70142 () Bool)

(assert (=> d!33756 e!70142))

(declare-fun res!88278 () Bool)

(assert (=> d!33756 (=> (not res!88278) (not e!70142))))

(declare-fun lt!159833 () (_ BitVec 64))

(declare-fun lt!159829 () (_ BitVec 64))

(declare-fun lt!159831 () (_ BitVec 64))

(assert (=> d!33756 (= res!88278 (= lt!159831 (bvsub lt!159829 lt!159833)))))

(assert (=> d!33756 (or (= (bvand lt!159829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159829 lt!159833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33756 (= lt!159833 (remainingBits!0 ((_ sign_extend 32) (size!2241 (buf!2623 thiss!1305))) ((_ sign_extend 32) (currentByte!5141 thiss!1305)) ((_ sign_extend 32) (currentBit!5136 thiss!1305))))))

(declare-fun lt!159828 () (_ BitVec 64))

(declare-fun lt!159832 () (_ BitVec 64))

(assert (=> d!33756 (= lt!159829 (bvmul lt!159828 lt!159832))))

(assert (=> d!33756 (or (= lt!159828 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159832 (bvsdiv (bvmul lt!159828 lt!159832) lt!159828)))))

(assert (=> d!33756 (= lt!159832 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33756 (= lt!159828 ((_ sign_extend 32) (size!2241 (buf!2623 thiss!1305))))))

(assert (=> d!33756 (= lt!159831 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5141 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5136 thiss!1305))))))

(assert (=> d!33756 (invariant!0 (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305) (size!2241 (buf!2623 thiss!1305)))))

(assert (=> d!33756 (= (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)) lt!159831)))

(declare-fun b!107131 () Bool)

(declare-fun res!88279 () Bool)

(assert (=> b!107131 (=> (not res!88279) (not e!70142))))

(assert (=> b!107131 (= res!88279 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159831))))

(declare-fun b!107132 () Bool)

(declare-fun lt!159830 () (_ BitVec 64))

(assert (=> b!107132 (= e!70142 (bvsle lt!159831 (bvmul lt!159830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107132 (or (= lt!159830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159830)))))

(assert (=> b!107132 (= lt!159830 ((_ sign_extend 32) (size!2241 (buf!2623 thiss!1305))))))

(assert (= (and d!33756 res!88278) b!107131))

(assert (= (and b!107131 res!88279) b!107132))

(declare-fun m!158147 () Bool)

(assert (=> d!33756 m!158147))

(declare-fun m!158149 () Bool)

(assert (=> d!33756 m!158149))

(assert (=> b!107117 d!33756))

(declare-fun d!33758 () Bool)

(declare-fun e!70143 () Bool)

(assert (=> d!33758 e!70143))

(declare-fun res!88280 () Bool)

(assert (=> d!33758 (=> (not res!88280) (not e!70143))))

(declare-fun lt!159839 () (_ BitVec 64))

(declare-fun lt!159837 () (_ BitVec 64))

(declare-fun lt!159835 () (_ BitVec 64))

(assert (=> d!33758 (= res!88280 (= lt!159837 (bvsub lt!159835 lt!159839)))))

(assert (=> d!33758 (or (= (bvand lt!159835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159835 lt!159839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33758 (= lt!159839 (remainingBits!0 ((_ sign_extend 32) (size!2241 (buf!2623 (_1!4672 lt!159782)))) ((_ sign_extend 32) (currentByte!5141 (_1!4672 lt!159782))) ((_ sign_extend 32) (currentBit!5136 (_1!4672 lt!159782)))))))

(declare-fun lt!159834 () (_ BitVec 64))

(declare-fun lt!159838 () (_ BitVec 64))

(assert (=> d!33758 (= lt!159835 (bvmul lt!159834 lt!159838))))

(assert (=> d!33758 (or (= lt!159834 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159838 (bvsdiv (bvmul lt!159834 lt!159838) lt!159834)))))

(assert (=> d!33758 (= lt!159838 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33758 (= lt!159834 ((_ sign_extend 32) (size!2241 (buf!2623 (_1!4672 lt!159782)))))))

(assert (=> d!33758 (= lt!159837 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5141 (_1!4672 lt!159782))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5136 (_1!4672 lt!159782)))))))

(assert (=> d!33758 (invariant!0 (currentBit!5136 (_1!4672 lt!159782)) (currentByte!5141 (_1!4672 lt!159782)) (size!2241 (buf!2623 (_1!4672 lt!159782))))))

(assert (=> d!33758 (= (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!159782))) (currentByte!5141 (_1!4672 lt!159782)) (currentBit!5136 (_1!4672 lt!159782))) lt!159837)))

(declare-fun b!107133 () Bool)

(declare-fun res!88281 () Bool)

(assert (=> b!107133 (=> (not res!88281) (not e!70143))))

(assert (=> b!107133 (= res!88281 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159837))))

(declare-fun b!107134 () Bool)

(declare-fun lt!159836 () (_ BitVec 64))

(assert (=> b!107134 (= e!70143 (bvsle lt!159837 (bvmul lt!159836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107134 (or (= lt!159836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159836)))))

(assert (=> b!107134 (= lt!159836 ((_ sign_extend 32) (size!2241 (buf!2623 (_1!4672 lt!159782)))))))

(assert (= (and d!33758 res!88280) b!107133))

(assert (= (and b!107133 res!88281) b!107134))

(declare-fun m!158151 () Bool)

(assert (=> d!33758 m!158151))

(declare-fun m!158153 () Bool)

(assert (=> d!33758 m!158153))

(assert (=> b!107106 d!33758))

(declare-fun d!33760 () Bool)

(assert (=> d!33760 (= (invariant!0 (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305) (size!2241 (buf!2623 (_2!4671 lt!159798)))) (and (bvsge (currentBit!5136 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5136 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5141 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5141 thiss!1305) (size!2241 (buf!2623 (_2!4671 lt!159798)))) (and (= (currentBit!5136 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5141 thiss!1305) (size!2241 (buf!2623 (_2!4671 lt!159798))))))))))

(assert (=> b!107116 d!33760))

(declare-fun d!33762 () Bool)

(assert (=> d!33762 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305) (size!2241 (buf!2623 thiss!1305))))))

(declare-fun bs!8239 () Bool)

(assert (= bs!8239 d!33762))

(assert (=> bs!8239 m!158149))

(assert (=> start!21242 d!33762))

(declare-fun b!107158 () Bool)

(declare-fun e!70156 () Unit!6560)

(declare-fun lt!159959 () Unit!6560)

(assert (=> b!107158 (= e!70156 lt!159959)))

(declare-fun lt!159946 () (_ BitVec 64))

(assert (=> b!107158 (= lt!159946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!159963 () (_ BitVec 64))

(assert (=> b!107158 (= lt!159963 (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4920 array!4920 (_ BitVec 64) (_ BitVec 64)) Unit!6560)

(assert (=> b!107158 (= lt!159959 (arrayBitRangesEqSymmetric!0 (buf!2623 thiss!1305) (buf!2623 (_2!4671 lt!159777)) lt!159946 lt!159963))))

(declare-fun arrayBitRangesEq!0 (array!4920 array!4920 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107158 (arrayBitRangesEq!0 (buf!2623 (_2!4671 lt!159777)) (buf!2623 thiss!1305) lt!159946 lt!159963)))

(declare-fun b!107159 () Bool)

(declare-fun Unit!6576 () Unit!6560)

(assert (=> b!107159 (= e!70156 Unit!6576)))

(declare-fun lt!159944 () tuple2!8832)

(declare-fun e!70157 () Bool)

(declare-fun b!107160 () Bool)

(declare-fun lt!159947 () (_ BitVec 64))

(declare-fun lt!159958 () (_ BitVec 64))

(assert (=> b!107160 (= e!70157 (= (_1!4673 lt!159944) (withMovedBitIndex!0 (_2!4673 lt!159944) (bvsub lt!159947 lt!159958))))))

(assert (=> b!107160 (or (= (bvand lt!159947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159958 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159947 lt!159958) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107160 (= lt!159958 (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159777))) (currentByte!5141 (_2!4671 lt!159777)) (currentBit!5136 (_2!4671 lt!159777))))))

(assert (=> b!107160 (= lt!159947 (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)))))

(declare-fun d!33764 () Bool)

(assert (=> d!33764 e!70157))

(declare-fun res!88303 () Bool)

(assert (=> d!33764 (=> (not res!88303) (not e!70157))))

(assert (=> d!33764 (= res!88303 (isPrefixOf!0 (_1!4673 lt!159944) (_2!4673 lt!159944)))))

(declare-fun lt!159961 () BitStream!3956)

(assert (=> d!33764 (= lt!159944 (tuple2!8833 lt!159961 (_2!4671 lt!159777)))))

(declare-fun lt!159950 () Unit!6560)

(declare-fun lt!159962 () Unit!6560)

(assert (=> d!33764 (= lt!159950 lt!159962)))

(assert (=> d!33764 (isPrefixOf!0 lt!159961 (_2!4671 lt!159777))))

(assert (=> d!33764 (= lt!159962 (lemmaIsPrefixTransitive!0 lt!159961 (_2!4671 lt!159777) (_2!4671 lt!159777)))))

(declare-fun lt!159954 () Unit!6560)

(declare-fun lt!159956 () Unit!6560)

(assert (=> d!33764 (= lt!159954 lt!159956)))

(assert (=> d!33764 (isPrefixOf!0 lt!159961 (_2!4671 lt!159777))))

(assert (=> d!33764 (= lt!159956 (lemmaIsPrefixTransitive!0 lt!159961 thiss!1305 (_2!4671 lt!159777)))))

(declare-fun lt!159945 () Unit!6560)

(assert (=> d!33764 (= lt!159945 e!70156)))

(declare-fun c!6602 () Bool)

(assert (=> d!33764 (= c!6602 (not (= (size!2241 (buf!2623 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!159952 () Unit!6560)

(declare-fun lt!159953 () Unit!6560)

(assert (=> d!33764 (= lt!159952 lt!159953)))

(assert (=> d!33764 (isPrefixOf!0 (_2!4671 lt!159777) (_2!4671 lt!159777))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3956) Unit!6560)

(assert (=> d!33764 (= lt!159953 (lemmaIsPrefixRefl!0 (_2!4671 lt!159777)))))

(declare-fun lt!159960 () Unit!6560)

(declare-fun lt!159955 () Unit!6560)

(assert (=> d!33764 (= lt!159960 lt!159955)))

(assert (=> d!33764 (= lt!159955 (lemmaIsPrefixRefl!0 (_2!4671 lt!159777)))))

(declare-fun lt!159951 () Unit!6560)

(declare-fun lt!159949 () Unit!6560)

(assert (=> d!33764 (= lt!159951 lt!159949)))

(assert (=> d!33764 (isPrefixOf!0 lt!159961 lt!159961)))

(assert (=> d!33764 (= lt!159949 (lemmaIsPrefixRefl!0 lt!159961))))

(declare-fun lt!159957 () Unit!6560)

(declare-fun lt!159948 () Unit!6560)

(assert (=> d!33764 (= lt!159957 lt!159948)))

(assert (=> d!33764 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33764 (= lt!159948 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33764 (= lt!159961 (BitStream!3957 (buf!2623 (_2!4671 lt!159777)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)))))

(assert (=> d!33764 (isPrefixOf!0 thiss!1305 (_2!4671 lt!159777))))

(assert (=> d!33764 (= (reader!0 thiss!1305 (_2!4671 lt!159777)) lt!159944)))

(declare-fun b!107161 () Bool)

(declare-fun res!88302 () Bool)

(assert (=> b!107161 (=> (not res!88302) (not e!70157))))

(assert (=> b!107161 (= res!88302 (isPrefixOf!0 (_2!4673 lt!159944) (_2!4671 lt!159777)))))

(declare-fun b!107162 () Bool)

(declare-fun res!88301 () Bool)

(assert (=> b!107162 (=> (not res!88301) (not e!70157))))

(assert (=> b!107162 (= res!88301 (isPrefixOf!0 (_1!4673 lt!159944) thiss!1305))))

(assert (= (and d!33764 c!6602) b!107158))

(assert (= (and d!33764 (not c!6602)) b!107159))

(assert (= (and d!33764 res!88303) b!107162))

(assert (= (and b!107162 res!88301) b!107161))

(assert (= (and b!107161 res!88302) b!107160))

(assert (=> b!107158 m!158061))

(declare-fun m!158185 () Bool)

(assert (=> b!107158 m!158185))

(declare-fun m!158187 () Bool)

(assert (=> b!107158 m!158187))

(declare-fun m!158189 () Bool)

(assert (=> b!107162 m!158189))

(declare-fun m!158191 () Bool)

(assert (=> d!33764 m!158191))

(declare-fun m!158193 () Bool)

(assert (=> d!33764 m!158193))

(declare-fun m!158195 () Bool)

(assert (=> d!33764 m!158195))

(declare-fun m!158197 () Bool)

(assert (=> d!33764 m!158197))

(declare-fun m!158199 () Bool)

(assert (=> d!33764 m!158199))

(declare-fun m!158201 () Bool)

(assert (=> d!33764 m!158201))

(declare-fun m!158203 () Bool)

(assert (=> d!33764 m!158203))

(assert (=> d!33764 m!158089))

(declare-fun m!158205 () Bool)

(assert (=> d!33764 m!158205))

(declare-fun m!158207 () Bool)

(assert (=> d!33764 m!158207))

(declare-fun m!158209 () Bool)

(assert (=> d!33764 m!158209))

(declare-fun m!158211 () Bool)

(assert (=> b!107161 m!158211))

(declare-fun m!158213 () Bool)

(assert (=> b!107160 m!158213))

(assert (=> b!107160 m!158077))

(assert (=> b!107160 m!158061))

(assert (=> b!107110 d!33764))

(declare-fun b!107173 () Bool)

(declare-fun res!88315 () Bool)

(declare-fun e!70163 () Bool)

(assert (=> b!107173 (=> (not res!88315) (not e!70163))))

(declare-fun lt!159974 () tuple2!8828)

(assert (=> b!107173 (= res!88315 (isPrefixOf!0 thiss!1305 (_2!4671 lt!159974)))))

(declare-fun b!107175 () Bool)

(declare-fun e!70162 () Bool)

(declare-fun lt!159972 () tuple2!8830)

(assert (=> b!107175 (= e!70162 (= (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!159972))) (currentByte!5141 (_1!4672 lt!159972)) (currentBit!5136 (_1!4672 lt!159972))) (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159974))) (currentByte!5141 (_2!4671 lt!159974)) (currentBit!5136 (_2!4671 lt!159974)))))))

(declare-fun b!107172 () Bool)

(declare-fun res!88312 () Bool)

(assert (=> b!107172 (=> (not res!88312) (not e!70163))))

(declare-fun lt!159973 () (_ BitVec 64))

(declare-fun lt!159975 () (_ BitVec 64))

(assert (=> b!107172 (= res!88312 (= (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159974))) (currentByte!5141 (_2!4671 lt!159974)) (currentBit!5136 (_2!4671 lt!159974))) (bvadd lt!159973 lt!159975)))))

(assert (=> b!107172 (or (not (= (bvand lt!159973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159975 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!159973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!159973 lt!159975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107172 (= lt!159975 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!107172 (= lt!159973 (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)))))

(declare-fun d!33782 () Bool)

(assert (=> d!33782 e!70163))

(declare-fun res!88313 () Bool)

(assert (=> d!33782 (=> (not res!88313) (not e!70163))))

(assert (=> d!33782 (= res!88313 (= (size!2241 (buf!2623 thiss!1305)) (size!2241 (buf!2623 (_2!4671 lt!159974)))))))

(declare-fun choose!16 (BitStream!3956 Bool) tuple2!8828)

(assert (=> d!33782 (= lt!159974 (choose!16 thiss!1305 lt!159790))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33782 (validate_offset_bit!0 ((_ sign_extend 32) (size!2241 (buf!2623 thiss!1305))) ((_ sign_extend 32) (currentByte!5141 thiss!1305)) ((_ sign_extend 32) (currentBit!5136 thiss!1305)))))

(assert (=> d!33782 (= (appendBit!0 thiss!1305 lt!159790) lt!159974)))

(declare-fun b!107174 () Bool)

(assert (=> b!107174 (= e!70163 e!70162)))

(declare-fun res!88314 () Bool)

(assert (=> b!107174 (=> (not res!88314) (not e!70162))))

(assert (=> b!107174 (= res!88314 (and (= (_2!4672 lt!159972) lt!159790) (= (_1!4672 lt!159972) (_2!4671 lt!159974))))))

(assert (=> b!107174 (= lt!159972 (readBitPure!0 (readerFrom!0 (_2!4671 lt!159974) (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305))))))

(assert (= (and d!33782 res!88313) b!107172))

(assert (= (and b!107172 res!88312) b!107173))

(assert (= (and b!107173 res!88315) b!107174))

(assert (= (and b!107174 res!88314) b!107175))

(declare-fun m!158215 () Bool)

(assert (=> b!107174 m!158215))

(assert (=> b!107174 m!158215))

(declare-fun m!158217 () Bool)

(assert (=> b!107174 m!158217))

(declare-fun m!158219 () Bool)

(assert (=> b!107175 m!158219))

(declare-fun m!158221 () Bool)

(assert (=> b!107175 m!158221))

(declare-fun m!158223 () Bool)

(assert (=> b!107173 m!158223))

(assert (=> b!107172 m!158221))

(assert (=> b!107172 m!158061))

(declare-fun m!158225 () Bool)

(assert (=> d!33782 m!158225))

(declare-fun m!158227 () Bool)

(assert (=> d!33782 m!158227))

(assert (=> b!107110 d!33782))

(declare-fun d!33784 () Bool)

(declare-fun res!88324 () Bool)

(declare-fun e!70169 () Bool)

(assert (=> d!33784 (=> (not res!88324) (not e!70169))))

(assert (=> d!33784 (= res!88324 (= (size!2241 (buf!2623 thiss!1305)) (size!2241 (buf!2623 (_2!4671 lt!159777)))))))

(assert (=> d!33784 (= (isPrefixOf!0 thiss!1305 (_2!4671 lt!159777)) e!70169)))

(declare-fun b!107182 () Bool)

(declare-fun res!88322 () Bool)

(assert (=> b!107182 (=> (not res!88322) (not e!70169))))

(assert (=> b!107182 (= res!88322 (bvsle (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)) (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159777))) (currentByte!5141 (_2!4671 lt!159777)) (currentBit!5136 (_2!4671 lt!159777)))))))

(declare-fun b!107183 () Bool)

(declare-fun e!70168 () Bool)

(assert (=> b!107183 (= e!70169 e!70168)))

(declare-fun res!88323 () Bool)

(assert (=> b!107183 (=> res!88323 e!70168)))

(assert (=> b!107183 (= res!88323 (= (size!2241 (buf!2623 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107184 () Bool)

(assert (=> b!107184 (= e!70168 (arrayBitRangesEq!0 (buf!2623 thiss!1305) (buf!2623 (_2!4671 lt!159777)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305))))))

(assert (= (and d!33784 res!88324) b!107182))

(assert (= (and b!107182 res!88322) b!107183))

(assert (= (and b!107183 (not res!88323)) b!107184))

(assert (=> b!107182 m!158061))

(assert (=> b!107182 m!158077))

(assert (=> b!107184 m!158061))

(assert (=> b!107184 m!158061))

(declare-fun m!158229 () Bool)

(assert (=> b!107184 m!158229))

(assert (=> b!107110 d!33784))

(declare-fun d!33786 () Bool)

(declare-fun e!70170 () Bool)

(assert (=> d!33786 e!70170))

(declare-fun res!88325 () Bool)

(assert (=> d!33786 (=> (not res!88325) (not e!70170))))

(declare-fun lt!159977 () (_ BitVec 64))

(declare-fun lt!159979 () (_ BitVec 64))

(declare-fun lt!159981 () (_ BitVec 64))

(assert (=> d!33786 (= res!88325 (= lt!159979 (bvsub lt!159977 lt!159981)))))

(assert (=> d!33786 (or (= (bvand lt!159977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159977 lt!159981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33786 (= lt!159981 (remainingBits!0 ((_ sign_extend 32) (size!2241 (buf!2623 (_1!4672 lt!159773)))) ((_ sign_extend 32) (currentByte!5141 (_1!4672 lt!159773))) ((_ sign_extend 32) (currentBit!5136 (_1!4672 lt!159773)))))))

(declare-fun lt!159976 () (_ BitVec 64))

(declare-fun lt!159980 () (_ BitVec 64))

(assert (=> d!33786 (= lt!159977 (bvmul lt!159976 lt!159980))))

(assert (=> d!33786 (or (= lt!159976 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159980 (bvsdiv (bvmul lt!159976 lt!159980) lt!159976)))))

(assert (=> d!33786 (= lt!159980 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33786 (= lt!159976 ((_ sign_extend 32) (size!2241 (buf!2623 (_1!4672 lt!159773)))))))

(assert (=> d!33786 (= lt!159979 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5141 (_1!4672 lt!159773))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5136 (_1!4672 lt!159773)))))))

(assert (=> d!33786 (invariant!0 (currentBit!5136 (_1!4672 lt!159773)) (currentByte!5141 (_1!4672 lt!159773)) (size!2241 (buf!2623 (_1!4672 lt!159773))))))

(assert (=> d!33786 (= (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!159773))) (currentByte!5141 (_1!4672 lt!159773)) (currentBit!5136 (_1!4672 lt!159773))) lt!159979)))

(declare-fun b!107185 () Bool)

(declare-fun res!88326 () Bool)

(assert (=> b!107185 (=> (not res!88326) (not e!70170))))

(assert (=> b!107185 (= res!88326 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159979))))

(declare-fun b!107186 () Bool)

(declare-fun lt!159978 () (_ BitVec 64))

(assert (=> b!107186 (= e!70170 (bvsle lt!159979 (bvmul lt!159978 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107186 (or (= lt!159978 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159978 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159978)))))

(assert (=> b!107186 (= lt!159978 ((_ sign_extend 32) (size!2241 (buf!2623 (_1!4672 lt!159773)))))))

(assert (= (and d!33786 res!88325) b!107185))

(assert (= (and b!107185 res!88326) b!107186))

(declare-fun m!158231 () Bool)

(assert (=> d!33786 m!158231))

(declare-fun m!158233 () Bool)

(assert (=> d!33786 m!158233))

(assert (=> b!107110 d!33786))

(declare-fun d!33788 () Bool)

(declare-datatypes ((tuple2!8846 0))(
  ( (tuple2!8847 (_1!4680 (_ BitVec 64)) (_2!4680 BitStream!3956)) )
))
(declare-fun lt!159984 () tuple2!8846)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8846)

(assert (=> d!33788 (= lt!159984 (readNLeastSignificantBitsLoop!0 (_1!4673 lt!159797) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159783))))

(assert (=> d!33788 (= (readNLeastSignificantBitsLoopPure!0 (_1!4673 lt!159797) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159783) (tuple2!8835 (_2!4680 lt!159984) (_1!4680 lt!159984)))))

(declare-fun bs!8244 () Bool)

(assert (= bs!8244 d!33788))

(declare-fun m!158235 () Bool)

(assert (=> bs!8244 m!158235))

(assert (=> b!107110 d!33788))

(declare-fun b!107385 () Bool)

(declare-fun e!70279 () Bool)

(declare-fun lt!160670 () tuple2!8832)

(declare-fun lt!160654 () tuple2!8834)

(assert (=> b!107385 (= e!70279 (and (= (_2!4674 lt!160654) v!199) (= (_1!4674 lt!160654) (_2!4673 lt!160670))))))

(declare-fun lt!160652 () (_ BitVec 64))

(assert (=> b!107385 (= lt!160654 (readNLeastSignificantBitsLoopPure!0 (_1!4673 lt!160670) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160652))))

(declare-fun lt!160660 () Unit!6560)

(declare-fun lt!160647 () Unit!6560)

(assert (=> b!107385 (= lt!160660 lt!160647)))

(declare-fun lt!160646 () tuple2!8828)

(declare-fun lt!160659 () (_ BitVec 64))

(assert (=> b!107385 (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!160646)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159798))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159798))) lt!160659)))

(assert (=> b!107385 (= lt!160647 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4671 lt!159798) (buf!2623 (_2!4671 lt!160646)) lt!160659))))

(declare-fun e!70281 () Bool)

(assert (=> b!107385 e!70281))

(declare-fun res!88480 () Bool)

(assert (=> b!107385 (=> (not res!88480) (not e!70281))))

(assert (=> b!107385 (= res!88480 (and (= (size!2241 (buf!2623 (_2!4671 lt!159798))) (size!2241 (buf!2623 (_2!4671 lt!160646)))) (bvsge lt!160659 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107385 (= lt!160659 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107385 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107385 (= lt!160652 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!107385 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107385 (= lt!160670 (reader!0 (_2!4671 lt!159798) (_2!4671 lt!160646)))))

(declare-fun b!107386 () Bool)

(declare-fun res!88478 () Bool)

(declare-fun lt!160673 () tuple2!8828)

(assert (=> b!107386 (= res!88478 (isPrefixOf!0 (_2!4671 lt!159798) (_2!4671 lt!160673)))))

(declare-fun e!70278 () Bool)

(assert (=> b!107386 (=> (not res!88478) (not e!70278))))

(declare-fun b!107387 () Bool)

(declare-fun e!70280 () tuple2!8828)

(declare-fun lt!160667 () tuple2!8828)

(declare-fun Unit!6578 () Unit!6560)

(assert (=> b!107387 (= e!70280 (tuple2!8829 Unit!6578 (_2!4671 lt!160667)))))

(declare-fun lt!160682 () Bool)

(assert (=> b!107387 (= lt!160682 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107387 (= lt!160673 (appendBit!0 (_2!4671 lt!159798) lt!160682))))

(declare-fun res!88483 () Bool)

(assert (=> b!107387 (= res!88483 (= (size!2241 (buf!2623 (_2!4671 lt!159798))) (size!2241 (buf!2623 (_2!4671 lt!160673)))))))

(assert (=> b!107387 (=> (not res!88483) (not e!70278))))

(assert (=> b!107387 e!70278))

(declare-fun lt!160644 () tuple2!8828)

(assert (=> b!107387 (= lt!160644 lt!160673)))

(assert (=> b!107387 (= lt!160667 (appendNLeastSignificantBitsLoop!0 (_2!4671 lt!160644) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!160683 () Unit!6560)

(assert (=> b!107387 (= lt!160683 (lemmaIsPrefixTransitive!0 (_2!4671 lt!159798) (_2!4671 lt!160644) (_2!4671 lt!160667)))))

(declare-fun call!1359 () Bool)

(assert (=> b!107387 call!1359))

(declare-fun lt!160645 () Unit!6560)

(assert (=> b!107387 (= lt!160645 lt!160683)))

(assert (=> b!107387 (invariant!0 (currentBit!5136 (_2!4671 lt!159798)) (currentByte!5141 (_2!4671 lt!159798)) (size!2241 (buf!2623 (_2!4671 lt!160644))))))

(declare-fun lt!160640 () BitStream!3956)

(assert (=> b!107387 (= lt!160640 (BitStream!3957 (buf!2623 (_2!4671 lt!160644)) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))))))

(assert (=> b!107387 (invariant!0 (currentBit!5136 lt!160640) (currentByte!5141 lt!160640) (size!2241 (buf!2623 (_2!4671 lt!160667))))))

(declare-fun lt!160658 () BitStream!3956)

(assert (=> b!107387 (= lt!160658 (BitStream!3957 (buf!2623 (_2!4671 lt!160667)) (currentByte!5141 lt!160640) (currentBit!5136 lt!160640)))))

(declare-fun lt!160676 () tuple2!8830)

(assert (=> b!107387 (= lt!160676 (readBitPure!0 lt!160640))))

(declare-fun lt!160665 () tuple2!8830)

(assert (=> b!107387 (= lt!160665 (readBitPure!0 lt!160658))))

(declare-fun lt!160664 () Unit!6560)

(assert (=> b!107387 (= lt!160664 (readBitPrefixLemma!0 lt!160640 (_2!4671 lt!160667)))))

(declare-fun res!88479 () Bool)

(assert (=> b!107387 (= res!88479 (= (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!160676))) (currentByte!5141 (_1!4672 lt!160676)) (currentBit!5136 (_1!4672 lt!160676))) (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!160665))) (currentByte!5141 (_1!4672 lt!160665)) (currentBit!5136 (_1!4672 lt!160665)))))))

(declare-fun e!70283 () Bool)

(assert (=> b!107387 (=> (not res!88479) (not e!70283))))

(assert (=> b!107387 e!70283))

(declare-fun lt!160648 () Unit!6560)

(assert (=> b!107387 (= lt!160648 lt!160664)))

(declare-fun lt!160668 () tuple2!8832)

(assert (=> b!107387 (= lt!160668 (reader!0 (_2!4671 lt!159798) (_2!4671 lt!160667)))))

(declare-fun lt!160663 () tuple2!8832)

(assert (=> b!107387 (= lt!160663 (reader!0 (_2!4671 lt!160644) (_2!4671 lt!160667)))))

(declare-fun lt!160656 () tuple2!8830)

(assert (=> b!107387 (= lt!160656 (readBitPure!0 (_1!4673 lt!160668)))))

(assert (=> b!107387 (= (_2!4672 lt!160656) lt!160682)))

(declare-fun lt!160681 () Unit!6560)

(declare-fun Unit!6580 () Unit!6560)

(assert (=> b!107387 (= lt!160681 Unit!6580)))

(declare-fun lt!160675 () (_ BitVec 64))

(assert (=> b!107387 (= lt!160675 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!160653 () (_ BitVec 64))

(assert (=> b!107387 (= lt!160653 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!160672 () Unit!6560)

(assert (=> b!107387 (= lt!160672 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4671 lt!159798) (buf!2623 (_2!4671 lt!160667)) lt!160653))))

(assert (=> b!107387 (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!160667)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159798))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159798))) lt!160653)))

(declare-fun lt!160678 () Unit!6560)

(assert (=> b!107387 (= lt!160678 lt!160672)))

(declare-fun lt!160649 () tuple2!8834)

(assert (=> b!107387 (= lt!160649 (readNLeastSignificantBitsLoopPure!0 (_1!4673 lt!160668) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160675))))

(declare-fun lt!160662 () (_ BitVec 64))

(assert (=> b!107387 (= lt!160662 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!160643 () Unit!6560)

(assert (=> b!107387 (= lt!160643 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4671 lt!160644) (buf!2623 (_2!4671 lt!160667)) lt!160662))))

(assert (=> b!107387 (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!160667)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!160644))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!160644))) lt!160662)))

(declare-fun lt!160657 () Unit!6560)

(assert (=> b!107387 (= lt!160657 lt!160643)))

(declare-fun lt!160661 () tuple2!8834)

(assert (=> b!107387 (= lt!160661 (readNLeastSignificantBitsLoopPure!0 (_1!4673 lt!160663) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!160675 (ite (_2!4672 lt!160656) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!160651 () tuple2!8834)

(assert (=> b!107387 (= lt!160651 (readNLeastSignificantBitsLoopPure!0 (_1!4673 lt!160668) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160675))))

(declare-fun c!6627 () Bool)

(assert (=> b!107387 (= c!6627 (_2!4672 (readBitPure!0 (_1!4673 lt!160668))))))

(declare-fun e!70282 () (_ BitVec 64))

(declare-fun lt!160669 () tuple2!8834)

(assert (=> b!107387 (= lt!160669 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4673 lt!160668) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!160675 e!70282)))))

(declare-fun lt!160650 () Unit!6560)

(assert (=> b!107387 (= lt!160650 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4673 lt!160668) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160675))))

(assert (=> b!107387 (and (= (_2!4674 lt!160651) (_2!4674 lt!160669)) (= (_1!4674 lt!160651) (_1!4674 lt!160669)))))

(declare-fun lt!160677 () Unit!6560)

(assert (=> b!107387 (= lt!160677 lt!160650)))

(assert (=> b!107387 (= (_1!4673 lt!160668) (withMovedBitIndex!0 (_2!4673 lt!160668) (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!160667))) (currentByte!5141 (_2!4671 lt!160667)) (currentBit!5136 (_2!4671 lt!160667))))))))

(declare-fun lt!160666 () Unit!6560)

(declare-fun Unit!6581 () Unit!6560)

(assert (=> b!107387 (= lt!160666 Unit!6581)))

(assert (=> b!107387 (= (_1!4673 lt!160663) (withMovedBitIndex!0 (_2!4673 lt!160663) (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!160644))) (currentByte!5141 (_2!4671 lt!160644)) (currentBit!5136 (_2!4671 lt!160644))) (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!160667))) (currentByte!5141 (_2!4671 lt!160667)) (currentBit!5136 (_2!4671 lt!160667))))))))

(declare-fun lt!160641 () Unit!6560)

(declare-fun Unit!6582 () Unit!6560)

(assert (=> b!107387 (= lt!160641 Unit!6582)))

(assert (=> b!107387 (= (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!160644))) (currentByte!5141 (_2!4671 lt!160644)) (currentBit!5136 (_2!4671 lt!160644))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!160655 () Unit!6560)

(declare-fun Unit!6583 () Unit!6560)

(assert (=> b!107387 (= lt!160655 Unit!6583)))

(assert (=> b!107387 (= (_2!4674 lt!160649) (_2!4674 lt!160661))))

(declare-fun lt!160684 () Unit!6560)

(declare-fun Unit!6584 () Unit!6560)

(assert (=> b!107387 (= lt!160684 Unit!6584)))

(assert (=> b!107387 (= (_1!4674 lt!160649) (_2!4673 lt!160668))))

(declare-fun b!107388 () Bool)

(assert (=> b!107388 (= e!70283 (= (_2!4672 lt!160676) (_2!4672 lt!160665)))))

(declare-fun b!107389 () Bool)

(declare-fun res!88481 () Bool)

(assert (=> b!107389 (=> (not res!88481) (not e!70279))))

(assert (=> b!107389 (= res!88481 (isPrefixOf!0 (_2!4671 lt!159798) (_2!4671 lt!160646)))))

(declare-fun b!107390 () Bool)

(declare-fun lt!160674 () Unit!6560)

(assert (=> b!107390 (= e!70280 (tuple2!8829 lt!160674 (_2!4671 lt!159798)))))

(declare-fun lt!160679 () BitStream!3956)

(assert (=> b!107390 (= lt!160679 (_2!4671 lt!159798))))

(assert (=> b!107390 (= lt!160674 (lemmaIsPrefixRefl!0 lt!160679))))

(assert (=> b!107390 call!1359))

(declare-fun b!107391 () Bool)

(assert (=> b!107391 (= e!70281 (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159798)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159798))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159798))) lt!160659))))

(declare-fun b!107392 () Bool)

(assert (=> b!107392 (= e!70282 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!107393 () Bool)

(declare-fun e!70277 () Bool)

(declare-fun lt!160642 () tuple2!8830)

(assert (=> b!107393 (= e!70277 (= (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!160642))) (currentByte!5141 (_1!4672 lt!160642)) (currentBit!5136 (_1!4672 lt!160642))) (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!160673))) (currentByte!5141 (_2!4671 lt!160673)) (currentBit!5136 (_2!4671 lt!160673)))))))

(declare-fun d!33790 () Bool)

(assert (=> d!33790 e!70279))

(declare-fun res!88485 () Bool)

(assert (=> d!33790 (=> (not res!88485) (not e!70279))))

(assert (=> d!33790 (= res!88485 (= (size!2241 (buf!2623 (_2!4671 lt!159798))) (size!2241 (buf!2623 (_2!4671 lt!160646)))))))

(assert (=> d!33790 (= lt!160646 e!70280)))

(declare-fun c!6628 () Bool)

(assert (=> d!33790 (= c!6628 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33790 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33790 (= (appendNLeastSignificantBitsLoop!0 (_2!4671 lt!159798) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!160646)))

(declare-fun b!107394 () Bool)

(declare-fun res!88482 () Bool)

(assert (=> b!107394 (= res!88482 (= (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!160673))) (currentByte!5141 (_2!4671 lt!160673)) (currentBit!5136 (_2!4671 lt!160673))) (bvadd (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!107394 (=> (not res!88482) (not e!70278))))

(declare-fun b!107395 () Bool)

(declare-fun res!88484 () Bool)

(assert (=> b!107395 (=> (not res!88484) (not e!70279))))

(declare-fun lt!160680 () (_ BitVec 64))

(declare-fun lt!160671 () (_ BitVec 64))

(assert (=> b!107395 (= res!88484 (= (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!160646))) (currentByte!5141 (_2!4671 lt!160646)) (currentBit!5136 (_2!4671 lt!160646))) (bvadd lt!160671 lt!160680)))))

(assert (=> b!107395 (or (not (= (bvand lt!160671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160680 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160671 lt!160680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107395 (= lt!160680 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107395 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107395 (= lt!160671 (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))))))

(declare-fun b!107396 () Bool)

(assert (=> b!107396 (= lt!160642 (readBitPure!0 (readerFrom!0 (_2!4671 lt!160673) (currentBit!5136 (_2!4671 lt!159798)) (currentByte!5141 (_2!4671 lt!159798)))))))

(declare-fun res!88477 () Bool)

(assert (=> b!107396 (= res!88477 (and (= (_2!4672 lt!160642) lt!160682) (= (_1!4672 lt!160642) (_2!4671 lt!160673))))))

(assert (=> b!107396 (=> (not res!88477) (not e!70277))))

(assert (=> b!107396 (= e!70278 e!70277)))

(declare-fun b!107397 () Bool)

(assert (=> b!107397 (= e!70282 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun bm!1356 () Bool)

(assert (=> bm!1356 (= call!1359 (isPrefixOf!0 (ite c!6628 (_2!4671 lt!159798) lt!160679) (ite c!6628 (_2!4671 lt!160667) lt!160679)))))

(assert (= (and d!33790 c!6628) b!107387))

(assert (= (and d!33790 (not c!6628)) b!107390))

(assert (= (and b!107387 res!88483) b!107394))

(assert (= (and b!107394 res!88482) b!107386))

(assert (= (and b!107386 res!88478) b!107396))

(assert (= (and b!107396 res!88477) b!107393))

(assert (= (and b!107387 res!88479) b!107388))

(assert (= (and b!107387 c!6627) b!107397))

(assert (= (and b!107387 (not c!6627)) b!107392))

(assert (= (or b!107387 b!107390) bm!1356))

(assert (= (and d!33790 res!88485) b!107395))

(assert (= (and b!107395 res!88484) b!107389))

(assert (= (and b!107389 res!88481) b!107385))

(assert (= (and b!107385 res!88480) b!107391))

(declare-fun m!158635 () Bool)

(assert (=> b!107395 m!158635))

(assert (=> b!107395 m!158057))

(declare-fun m!158637 () Bool)

(assert (=> b!107385 m!158637))

(declare-fun m!158639 () Bool)

(assert (=> b!107385 m!158639))

(declare-fun m!158641 () Bool)

(assert (=> b!107385 m!158641))

(declare-fun m!158643 () Bool)

(assert (=> b!107385 m!158643))

(declare-fun m!158645 () Bool)

(assert (=> b!107385 m!158645))

(declare-fun m!158647 () Bool)

(assert (=> b!107391 m!158647))

(declare-fun m!158649 () Bool)

(assert (=> b!107396 m!158649))

(assert (=> b!107396 m!158649))

(declare-fun m!158651 () Bool)

(assert (=> b!107396 m!158651))

(declare-fun m!158653 () Bool)

(assert (=> b!107393 m!158653))

(declare-fun m!158655 () Bool)

(assert (=> b!107393 m!158655))

(declare-fun m!158657 () Bool)

(assert (=> b!107389 m!158657))

(declare-fun m!158659 () Bool)

(assert (=> b!107387 m!158659))

(declare-fun m!158661 () Bool)

(assert (=> b!107387 m!158661))

(assert (=> b!107387 m!158639))

(declare-fun m!158663 () Bool)

(assert (=> b!107387 m!158663))

(declare-fun m!158665 () Bool)

(assert (=> b!107387 m!158665))

(declare-fun m!158667 () Bool)

(assert (=> b!107387 m!158667))

(declare-fun m!158669 () Bool)

(assert (=> b!107387 m!158669))

(declare-fun m!158671 () Bool)

(assert (=> b!107387 m!158671))

(assert (=> b!107387 m!158659))

(declare-fun m!158673 () Bool)

(assert (=> b!107387 m!158673))

(declare-fun m!158675 () Bool)

(assert (=> b!107387 m!158675))

(declare-fun m!158677 () Bool)

(assert (=> b!107387 m!158677))

(declare-fun m!158679 () Bool)

(assert (=> b!107387 m!158679))

(declare-fun m!158681 () Bool)

(assert (=> b!107387 m!158681))

(declare-fun m!158683 () Bool)

(assert (=> b!107387 m!158683))

(declare-fun m!158685 () Bool)

(assert (=> b!107387 m!158685))

(declare-fun m!158687 () Bool)

(assert (=> b!107387 m!158687))

(declare-fun m!158689 () Bool)

(assert (=> b!107387 m!158689))

(declare-fun m!158691 () Bool)

(assert (=> b!107387 m!158691))

(declare-fun m!158693 () Bool)

(assert (=> b!107387 m!158693))

(declare-fun m!158695 () Bool)

(assert (=> b!107387 m!158695))

(declare-fun m!158697 () Bool)

(assert (=> b!107387 m!158697))

(assert (=> b!107387 m!158057))

(declare-fun m!158699 () Bool)

(assert (=> b!107387 m!158699))

(declare-fun m!158701 () Bool)

(assert (=> b!107387 m!158701))

(declare-fun m!158703 () Bool)

(assert (=> b!107387 m!158703))

(declare-fun m!158705 () Bool)

(assert (=> b!107387 m!158705))

(declare-fun m!158707 () Bool)

(assert (=> b!107387 m!158707))

(declare-fun m!158709 () Bool)

(assert (=> b!107387 m!158709))

(declare-fun m!158711 () Bool)

(assert (=> b!107386 m!158711))

(declare-fun m!158713 () Bool)

(assert (=> bm!1356 m!158713))

(assert (=> b!107394 m!158655))

(assert (=> b!107394 m!158057))

(declare-fun m!158715 () Bool)

(assert (=> b!107390 m!158715))

(assert (=> b!107110 d!33790))

(declare-fun d!33886 () Bool)

(assert (=> d!33886 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159798))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159798))) lt!159778) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159798))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159798)))) lt!159778))))

(declare-fun bs!8267 () Bool)

(assert (= bs!8267 d!33886))

(declare-fun m!158717 () Bool)

(assert (=> bs!8267 m!158717))

(assert (=> b!107110 d!33886))

(declare-fun d!33888 () Bool)

(declare-fun e!70292 () Bool)

(assert (=> d!33888 e!70292))

(declare-fun res!88500 () Bool)

(assert (=> d!33888 (=> (not res!88500) (not e!70292))))

(declare-fun lt!160710 () tuple2!8830)

(declare-fun lt!160707 () tuple2!8830)

(assert (=> d!33888 (= res!88500 (= (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!160710))) (currentByte!5141 (_1!4672 lt!160710)) (currentBit!5136 (_1!4672 lt!160710))) (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!160707))) (currentByte!5141 (_1!4672 lt!160707)) (currentBit!5136 (_1!4672 lt!160707)))))))

(declare-fun lt!160709 () BitStream!3956)

(declare-fun lt!160708 () Unit!6560)

(declare-fun choose!50 (BitStream!3956 BitStream!3956 BitStream!3956 tuple2!8830 tuple2!8830 BitStream!3956 Bool tuple2!8830 tuple2!8830 BitStream!3956 Bool) Unit!6560)

(assert (=> d!33888 (= lt!160708 (choose!50 lt!159774 (_2!4671 lt!159777) lt!160709 lt!160710 (tuple2!8831 (_1!4672 lt!160710) (_2!4672 lt!160710)) (_1!4672 lt!160710) (_2!4672 lt!160710) lt!160707 (tuple2!8831 (_1!4672 lt!160707) (_2!4672 lt!160707)) (_1!4672 lt!160707) (_2!4672 lt!160707)))))

(assert (=> d!33888 (= lt!160707 (readBitPure!0 lt!160709))))

(assert (=> d!33888 (= lt!160710 (readBitPure!0 lt!159774))))

(assert (=> d!33888 (= lt!160709 (BitStream!3957 (buf!2623 (_2!4671 lt!159777)) (currentByte!5141 lt!159774) (currentBit!5136 lt!159774)))))

(assert (=> d!33888 (invariant!0 (currentBit!5136 lt!159774) (currentByte!5141 lt!159774) (size!2241 (buf!2623 (_2!4671 lt!159777))))))

(assert (=> d!33888 (= (readBitPrefixLemma!0 lt!159774 (_2!4671 lt!159777)) lt!160708)))

(declare-fun b!107413 () Bool)

(assert (=> b!107413 (= e!70292 (= (_2!4672 lt!160710) (_2!4672 lt!160707)))))

(assert (= (and d!33888 res!88500) b!107413))

(declare-fun m!158739 () Bool)

(assert (=> d!33888 m!158739))

(declare-fun m!158741 () Bool)

(assert (=> d!33888 m!158741))

(declare-fun m!158743 () Bool)

(assert (=> d!33888 m!158743))

(assert (=> d!33888 m!158117))

(declare-fun m!158745 () Bool)

(assert (=> d!33888 m!158745))

(declare-fun m!158747 () Bool)

(assert (=> d!33888 m!158747))

(assert (=> b!107110 d!33888))

(declare-fun d!33900 () Bool)

(assert (=> d!33900 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!107110 d!33900))

(declare-fun d!33902 () Bool)

(declare-fun lt!160711 () tuple2!8842)

(assert (=> d!33902 (= lt!160711 (readBit!0 lt!159774))))

(assert (=> d!33902 (= (readBitPure!0 lt!159774) (tuple2!8831 (_2!4678 lt!160711) (_1!4678 lt!160711)))))

(declare-fun bs!8271 () Bool)

(assert (= bs!8271 d!33902))

(declare-fun m!158749 () Bool)

(assert (=> bs!8271 m!158749))

(assert (=> b!107110 d!33902))

(declare-fun d!33904 () Bool)

(declare-fun e!70297 () Bool)

(assert (=> d!33904 e!70297))

(declare-fun res!88507 () Bool)

(assert (=> d!33904 (=> (not res!88507) (not e!70297))))

(declare-fun lt!160715 () (_ BitVec 64))

(declare-fun lt!160713 () (_ BitVec 64))

(declare-fun lt!160717 () (_ BitVec 64))

(assert (=> d!33904 (= res!88507 (= lt!160715 (bvsub lt!160713 lt!160717)))))

(assert (=> d!33904 (or (= (bvand lt!160713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160717 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160713 lt!160717) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33904 (= lt!160717 (remainingBits!0 ((_ sign_extend 32) (size!2241 (buf!2623 (_1!4672 lt!159792)))) ((_ sign_extend 32) (currentByte!5141 (_1!4672 lt!159792))) ((_ sign_extend 32) (currentBit!5136 (_1!4672 lt!159792)))))))

(declare-fun lt!160712 () (_ BitVec 64))

(declare-fun lt!160716 () (_ BitVec 64))

(assert (=> d!33904 (= lt!160713 (bvmul lt!160712 lt!160716))))

(assert (=> d!33904 (or (= lt!160712 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160716 (bvsdiv (bvmul lt!160712 lt!160716) lt!160712)))))

(assert (=> d!33904 (= lt!160716 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33904 (= lt!160712 ((_ sign_extend 32) (size!2241 (buf!2623 (_1!4672 lt!159792)))))))

(assert (=> d!33904 (= lt!160715 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5141 (_1!4672 lt!159792))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5136 (_1!4672 lt!159792)))))))

(assert (=> d!33904 (invariant!0 (currentBit!5136 (_1!4672 lt!159792)) (currentByte!5141 (_1!4672 lt!159792)) (size!2241 (buf!2623 (_1!4672 lt!159792))))))

(assert (=> d!33904 (= (bitIndex!0 (size!2241 (buf!2623 (_1!4672 lt!159792))) (currentByte!5141 (_1!4672 lt!159792)) (currentBit!5136 (_1!4672 lt!159792))) lt!160715)))

(declare-fun b!107420 () Bool)

(declare-fun res!88508 () Bool)

(assert (=> b!107420 (=> (not res!88508) (not e!70297))))

(assert (=> b!107420 (= res!88508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160715))))

(declare-fun b!107421 () Bool)

(declare-fun lt!160714 () (_ BitVec 64))

(assert (=> b!107421 (= e!70297 (bvsle lt!160715 (bvmul lt!160714 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107421 (or (= lt!160714 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160714 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160714)))))

(assert (=> b!107421 (= lt!160714 ((_ sign_extend 32) (size!2241 (buf!2623 (_1!4672 lt!159792)))))))

(assert (= (and d!33904 res!88507) b!107420))

(assert (= (and b!107420 res!88508) b!107421))

(declare-fun m!158751 () Bool)

(assert (=> d!33904 m!158751))

(declare-fun m!158753 () Bool)

(assert (=> d!33904 m!158753))

(assert (=> b!107110 d!33904))

(declare-fun d!33906 () Bool)

(assert (=> d!33906 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))) ((_ sign_extend 32) (currentByte!5141 thiss!1305)) ((_ sign_extend 32) (currentBit!5136 thiss!1305)) lt!159794) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))) ((_ sign_extend 32) (currentByte!5141 thiss!1305)) ((_ sign_extend 32) (currentBit!5136 thiss!1305))) lt!159794))))

(declare-fun bs!8272 () Bool)

(assert (= bs!8272 d!33906))

(declare-fun m!158755 () Bool)

(assert (=> bs!8272 m!158755))

(assert (=> b!107110 d!33906))

(declare-fun lt!160718 () tuple2!8846)

(declare-fun d!33908 () Bool)

(assert (=> d!33908 (= lt!160718 (readNLeastSignificantBitsLoop!0 (_1!4673 lt!159781) nBits!396 i!615 lt!159793))))

(assert (=> d!33908 (= (readNLeastSignificantBitsLoopPure!0 (_1!4673 lt!159781) nBits!396 i!615 lt!159793) (tuple2!8835 (_2!4680 lt!160718) (_1!4680 lt!160718)))))

(declare-fun bs!8273 () Bool)

(assert (= bs!8273 d!33908))

(declare-fun m!158757 () Bool)

(assert (=> bs!8273 m!158757))

(assert (=> b!107110 d!33908))

(declare-fun d!33912 () Bool)

(assert (=> d!33912 (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159798))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159798))) lt!159778)))

(declare-fun lt!160735 () Unit!6560)

(declare-fun choose!9 (BitStream!3956 array!4920 (_ BitVec 64) BitStream!3956) Unit!6560)

(assert (=> d!33912 (= lt!160735 (choose!9 (_2!4671 lt!159798) (buf!2623 (_2!4671 lt!159777)) lt!159778 (BitStream!3957 (buf!2623 (_2!4671 lt!159777)) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798)))))))

(assert (=> d!33912 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4671 lt!159798) (buf!2623 (_2!4671 lt!159777)) lt!159778) lt!160735)))

(declare-fun bs!8275 () Bool)

(assert (= bs!8275 d!33912))

(assert (=> bs!8275 m!158111))

(declare-fun m!158779 () Bool)

(assert (=> bs!8275 m!158779))

(assert (=> b!107110 d!33912))

(declare-fun d!33924 () Bool)

(assert (=> d!33924 (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))) ((_ sign_extend 32) (currentByte!5141 thiss!1305)) ((_ sign_extend 32) (currentBit!5136 thiss!1305)) lt!159794)))

(declare-fun lt!160737 () Unit!6560)

(assert (=> d!33924 (= lt!160737 (choose!9 thiss!1305 (buf!2623 (_2!4671 lt!159777)) lt!159794 (BitStream!3957 (buf!2623 (_2!4671 lt!159777)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305))))))

(assert (=> d!33924 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2623 (_2!4671 lt!159777)) lt!159794) lt!160737)))

(declare-fun bs!8276 () Bool)

(assert (= bs!8276 d!33924))

(assert (=> bs!8276 m!158107))

(declare-fun m!158781 () Bool)

(assert (=> bs!8276 m!158781))

(assert (=> b!107110 d!33924))

(declare-fun d!33926 () Bool)

(declare-fun lt!160738 () tuple2!8842)

(assert (=> d!33926 (= lt!160738 (readBit!0 (_1!4673 lt!159781)))))

(assert (=> d!33926 (= (readBitPure!0 (_1!4673 lt!159781)) (tuple2!8831 (_2!4678 lt!160738) (_1!4678 lt!160738)))))

(declare-fun bs!8277 () Bool)

(assert (= bs!8277 d!33926))

(declare-fun m!158783 () Bool)

(assert (=> bs!8277 m!158783))

(assert (=> b!107110 d!33926))

(declare-fun b!107433 () Bool)

(declare-fun e!70305 () Unit!6560)

(declare-fun lt!160754 () Unit!6560)

(assert (=> b!107433 (= e!70305 lt!160754)))

(declare-fun lt!160741 () (_ BitVec 64))

(assert (=> b!107433 (= lt!160741 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160758 () (_ BitVec 64))

(assert (=> b!107433 (= lt!160758 (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))))))

(assert (=> b!107433 (= lt!160754 (arrayBitRangesEqSymmetric!0 (buf!2623 (_2!4671 lt!159798)) (buf!2623 (_2!4671 lt!159777)) lt!160741 lt!160758))))

(assert (=> b!107433 (arrayBitRangesEq!0 (buf!2623 (_2!4671 lt!159777)) (buf!2623 (_2!4671 lt!159798)) lt!160741 lt!160758)))

(declare-fun b!107434 () Bool)

(declare-fun Unit!6585 () Unit!6560)

(assert (=> b!107434 (= e!70305 Unit!6585)))

(declare-fun b!107435 () Bool)

(declare-fun lt!160742 () (_ BitVec 64))

(declare-fun lt!160739 () tuple2!8832)

(declare-fun lt!160753 () (_ BitVec 64))

(declare-fun e!70306 () Bool)

(assert (=> b!107435 (= e!70306 (= (_1!4673 lt!160739) (withMovedBitIndex!0 (_2!4673 lt!160739) (bvsub lt!160742 lt!160753))))))

(assert (=> b!107435 (or (= (bvand lt!160742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160753 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160742 lt!160753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107435 (= lt!160753 (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159777))) (currentByte!5141 (_2!4671 lt!159777)) (currentBit!5136 (_2!4671 lt!159777))))))

(assert (=> b!107435 (= lt!160742 (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))))))

(declare-fun d!33928 () Bool)

(assert (=> d!33928 e!70306))

(declare-fun res!88523 () Bool)

(assert (=> d!33928 (=> (not res!88523) (not e!70306))))

(assert (=> d!33928 (= res!88523 (isPrefixOf!0 (_1!4673 lt!160739) (_2!4673 lt!160739)))))

(declare-fun lt!160756 () BitStream!3956)

(assert (=> d!33928 (= lt!160739 (tuple2!8833 lt!160756 (_2!4671 lt!159777)))))

(declare-fun lt!160745 () Unit!6560)

(declare-fun lt!160757 () Unit!6560)

(assert (=> d!33928 (= lt!160745 lt!160757)))

(assert (=> d!33928 (isPrefixOf!0 lt!160756 (_2!4671 lt!159777))))

(assert (=> d!33928 (= lt!160757 (lemmaIsPrefixTransitive!0 lt!160756 (_2!4671 lt!159777) (_2!4671 lt!159777)))))

(declare-fun lt!160749 () Unit!6560)

(declare-fun lt!160751 () Unit!6560)

(assert (=> d!33928 (= lt!160749 lt!160751)))

(assert (=> d!33928 (isPrefixOf!0 lt!160756 (_2!4671 lt!159777))))

(assert (=> d!33928 (= lt!160751 (lemmaIsPrefixTransitive!0 lt!160756 (_2!4671 lt!159798) (_2!4671 lt!159777)))))

(declare-fun lt!160740 () Unit!6560)

(assert (=> d!33928 (= lt!160740 e!70305)))

(declare-fun c!6629 () Bool)

(assert (=> d!33928 (= c!6629 (not (= (size!2241 (buf!2623 (_2!4671 lt!159798))) #b00000000000000000000000000000000)))))

(declare-fun lt!160747 () Unit!6560)

(declare-fun lt!160748 () Unit!6560)

(assert (=> d!33928 (= lt!160747 lt!160748)))

(assert (=> d!33928 (isPrefixOf!0 (_2!4671 lt!159777) (_2!4671 lt!159777))))

(assert (=> d!33928 (= lt!160748 (lemmaIsPrefixRefl!0 (_2!4671 lt!159777)))))

(declare-fun lt!160755 () Unit!6560)

(declare-fun lt!160750 () Unit!6560)

(assert (=> d!33928 (= lt!160755 lt!160750)))

(assert (=> d!33928 (= lt!160750 (lemmaIsPrefixRefl!0 (_2!4671 lt!159777)))))

(declare-fun lt!160746 () Unit!6560)

(declare-fun lt!160744 () Unit!6560)

(assert (=> d!33928 (= lt!160746 lt!160744)))

(assert (=> d!33928 (isPrefixOf!0 lt!160756 lt!160756)))

(assert (=> d!33928 (= lt!160744 (lemmaIsPrefixRefl!0 lt!160756))))

(declare-fun lt!160752 () Unit!6560)

(declare-fun lt!160743 () Unit!6560)

(assert (=> d!33928 (= lt!160752 lt!160743)))

(assert (=> d!33928 (isPrefixOf!0 (_2!4671 lt!159798) (_2!4671 lt!159798))))

(assert (=> d!33928 (= lt!160743 (lemmaIsPrefixRefl!0 (_2!4671 lt!159798)))))

(assert (=> d!33928 (= lt!160756 (BitStream!3957 (buf!2623 (_2!4671 lt!159777)) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))))))

(assert (=> d!33928 (isPrefixOf!0 (_2!4671 lt!159798) (_2!4671 lt!159777))))

(assert (=> d!33928 (= (reader!0 (_2!4671 lt!159798) (_2!4671 lt!159777)) lt!160739)))

(declare-fun b!107436 () Bool)

(declare-fun res!88522 () Bool)

(assert (=> b!107436 (=> (not res!88522) (not e!70306))))

(assert (=> b!107436 (= res!88522 (isPrefixOf!0 (_2!4673 lt!160739) (_2!4671 lt!159777)))))

(declare-fun b!107437 () Bool)

(declare-fun res!88521 () Bool)

(assert (=> b!107437 (=> (not res!88521) (not e!70306))))

(assert (=> b!107437 (= res!88521 (isPrefixOf!0 (_1!4673 lt!160739) (_2!4671 lt!159798)))))

(assert (= (and d!33928 c!6629) b!107433))

(assert (= (and d!33928 (not c!6629)) b!107434))

(assert (= (and d!33928 res!88523) b!107437))

(assert (= (and b!107437 res!88521) b!107436))

(assert (= (and b!107436 res!88522) b!107435))

(assert (=> b!107433 m!158057))

(declare-fun m!158785 () Bool)

(assert (=> b!107433 m!158785))

(declare-fun m!158787 () Bool)

(assert (=> b!107433 m!158787))

(declare-fun m!158789 () Bool)

(assert (=> b!107437 m!158789))

(declare-fun m!158791 () Bool)

(assert (=> d!33928 m!158791))

(declare-fun m!158793 () Bool)

(assert (=> d!33928 m!158793))

(assert (=> d!33928 m!158195))

(declare-fun m!158795 () Bool)

(assert (=> d!33928 m!158795))

(declare-fun m!158797 () Bool)

(assert (=> d!33928 m!158797))

(assert (=> d!33928 m!158201))

(declare-fun m!158799 () Bool)

(assert (=> d!33928 m!158799))

(declare-fun m!158801 () Bool)

(assert (=> d!33928 m!158801))

(declare-fun m!158803 () Bool)

(assert (=> d!33928 m!158803))

(declare-fun m!158805 () Bool)

(assert (=> d!33928 m!158805))

(declare-fun m!158807 () Bool)

(assert (=> d!33928 m!158807))

(declare-fun m!158809 () Bool)

(assert (=> b!107436 m!158809))

(declare-fun m!158811 () Bool)

(assert (=> b!107435 m!158811))

(assert (=> b!107435 m!158077))

(assert (=> b!107435 m!158057))

(assert (=> b!107110 d!33928))

(declare-fun d!33930 () Bool)

(assert (=> d!33930 (isPrefixOf!0 thiss!1305 (_2!4671 lt!159777))))

(declare-fun lt!160761 () Unit!6560)

(declare-fun choose!30 (BitStream!3956 BitStream!3956 BitStream!3956) Unit!6560)

(assert (=> d!33930 (= lt!160761 (choose!30 thiss!1305 (_2!4671 lt!159798) (_2!4671 lt!159777)))))

(assert (=> d!33930 (isPrefixOf!0 thiss!1305 (_2!4671 lt!159798))))

(assert (=> d!33930 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4671 lt!159798) (_2!4671 lt!159777)) lt!160761)))

(declare-fun bs!8280 () Bool)

(assert (= bs!8280 d!33930))

(assert (=> bs!8280 m!158089))

(declare-fun m!158813 () Bool)

(assert (=> bs!8280 m!158813))

(assert (=> bs!8280 m!158069))

(assert (=> b!107110 d!33930))

(declare-fun d!33942 () Bool)

(declare-fun lt!160762 () tuple2!8842)

(assert (=> d!33942 (= lt!160762 (readBit!0 (BitStream!3957 (buf!2623 (_2!4671 lt!159777)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305))))))

(assert (=> d!33942 (= (readBitPure!0 (BitStream!3957 (buf!2623 (_2!4671 lt!159777)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305))) (tuple2!8831 (_2!4678 lt!160762) (_1!4678 lt!160762)))))

(declare-fun bs!8281 () Bool)

(assert (= bs!8281 d!33942))

(declare-fun m!158815 () Bool)

(assert (=> bs!8281 m!158815))

(assert (=> b!107110 d!33942))

(declare-fun d!33944 () Bool)

(declare-fun e!70312 () Bool)

(assert (=> d!33944 e!70312))

(declare-fun res!88529 () Bool)

(assert (=> d!33944 (=> (not res!88529) (not e!70312))))

(declare-fun lt!160767 () BitStream!3956)

(declare-fun lt!160768 () (_ BitVec 64))

(assert (=> d!33944 (= res!88529 (= (bvadd lt!160768 (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) lt!159775)) (bitIndex!0 (size!2241 (buf!2623 lt!160767)) (currentByte!5141 lt!160767) (currentBit!5136 lt!160767))))))

(assert (=> d!33944 (or (not (= (bvand lt!160768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) lt!159775) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160768 (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) lt!159775)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33944 (= lt!160768 (bitIndex!0 (size!2241 (buf!2623 (_2!4673 lt!159797))) (currentByte!5141 (_2!4673 lt!159797)) (currentBit!5136 (_2!4673 lt!159797))))))

(declare-fun moveBitIndex!0 (BitStream!3956 (_ BitVec 64)) tuple2!8828)

(assert (=> d!33944 (= lt!160767 (_2!4671 (moveBitIndex!0 (_2!4673 lt!159797) (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) lt!159775))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3956 (_ BitVec 64)) Bool)

(assert (=> d!33944 (moveBitIndexPrecond!0 (_2!4673 lt!159797) (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) lt!159775))))

(assert (=> d!33944 (= (withMovedBitIndex!0 (_2!4673 lt!159797) (bvsub (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798))) lt!159775)) lt!160767)))

(declare-fun b!107443 () Bool)

(assert (=> b!107443 (= e!70312 (= (size!2241 (buf!2623 (_2!4673 lt!159797))) (size!2241 (buf!2623 lt!160767))))))

(assert (= (and d!33944 res!88529) b!107443))

(declare-fun m!158817 () Bool)

(assert (=> d!33944 m!158817))

(declare-fun m!158819 () Bool)

(assert (=> d!33944 m!158819))

(declare-fun m!158821 () Bool)

(assert (=> d!33944 m!158821))

(declare-fun m!158823 () Bool)

(assert (=> d!33944 m!158823))

(assert (=> b!107108 d!33944))

(assert (=> b!107108 d!33746))

(declare-fun lt!160769 () tuple2!8846)

(declare-fun d!33946 () Bool)

(assert (=> d!33946 (= lt!160769 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4673 lt!159781) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159783))))

(assert (=> d!33946 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4673 lt!159781) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159783) (tuple2!8835 (_2!4680 lt!160769) (_1!4680 lt!160769)))))

(declare-fun bs!8282 () Bool)

(assert (= bs!8282 d!33946))

(assert (=> bs!8282 m!158081))

(declare-fun m!158825 () Bool)

(assert (=> bs!8282 m!158825))

(assert (=> b!107113 d!33946))

(declare-fun d!33948 () Bool)

(declare-fun e!70313 () Bool)

(assert (=> d!33948 e!70313))

(declare-fun res!88530 () Bool)

(assert (=> d!33948 (=> (not res!88530) (not e!70313))))

(declare-fun lt!160771 () (_ BitVec 64))

(declare-fun lt!160770 () BitStream!3956)

(assert (=> d!33948 (= res!88530 (= (bvadd lt!160771 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2241 (buf!2623 lt!160770)) (currentByte!5141 lt!160770) (currentBit!5136 lt!160770))))))

(assert (=> d!33948 (or (not (= (bvand lt!160771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160771 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160771 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33948 (= lt!160771 (bitIndex!0 (size!2241 (buf!2623 (_1!4673 lt!159781))) (currentByte!5141 (_1!4673 lt!159781)) (currentBit!5136 (_1!4673 lt!159781))))))

(assert (=> d!33948 (= lt!160770 (_2!4671 (moveBitIndex!0 (_1!4673 lt!159781) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33948 (moveBitIndexPrecond!0 (_1!4673 lt!159781) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33948 (= (withMovedBitIndex!0 (_1!4673 lt!159781) #b0000000000000000000000000000000000000000000000000000000000000001) lt!160770)))

(declare-fun b!107444 () Bool)

(assert (=> b!107444 (= e!70313 (= (size!2241 (buf!2623 (_1!4673 lt!159781))) (size!2241 (buf!2623 lt!160770))))))

(assert (= (and d!33948 res!88530) b!107444))

(declare-fun m!158827 () Bool)

(assert (=> d!33948 m!158827))

(declare-fun m!158829 () Bool)

(assert (=> d!33948 m!158829))

(declare-fun m!158831 () Bool)

(assert (=> d!33948 m!158831))

(declare-fun m!158833 () Bool)

(assert (=> d!33948 m!158833))

(assert (=> b!107113 d!33948))

(declare-fun d!33950 () Bool)

(declare-fun lt!160789 () tuple2!8834)

(declare-fun lt!160788 () tuple2!8834)

(assert (=> d!33950 (and (= (_2!4674 lt!160789) (_2!4674 lt!160788)) (= (_1!4674 lt!160789) (_1!4674 lt!160788)))))

(declare-fun lt!160784 () BitStream!3956)

(declare-fun lt!160787 () (_ BitVec 64))

(declare-fun lt!160785 () Bool)

(declare-fun lt!160786 () Unit!6560)

(declare-fun choose!45 (BitStream!3956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8834 tuple2!8834 BitStream!3956 (_ BitVec 64) Bool BitStream!3956 (_ BitVec 64) tuple2!8834 tuple2!8834 BitStream!3956 (_ BitVec 64)) Unit!6560)

(assert (=> d!33950 (= lt!160786 (choose!45 (_1!4673 lt!159781) nBits!396 i!615 lt!159793 lt!160789 (tuple2!8835 (_1!4674 lt!160789) (_2!4674 lt!160789)) (_1!4674 lt!160789) (_2!4674 lt!160789) lt!160785 lt!160784 lt!160787 lt!160788 (tuple2!8835 (_1!4674 lt!160788) (_2!4674 lt!160788)) (_1!4674 lt!160788) (_2!4674 lt!160788)))))

(assert (=> d!33950 (= lt!160788 (readNLeastSignificantBitsLoopPure!0 lt!160784 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!160787))))

(assert (=> d!33950 (= lt!160787 (bvor lt!159793 (ite lt!160785 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33950 (= lt!160784 (withMovedBitIndex!0 (_1!4673 lt!159781) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33950 (= lt!160785 (_2!4672 (readBitPure!0 (_1!4673 lt!159781))))))

(assert (=> d!33950 (= lt!160789 (readNLeastSignificantBitsLoopPure!0 (_1!4673 lt!159781) nBits!396 i!615 lt!159793))))

(assert (=> d!33950 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4673 lt!159781) nBits!396 i!615 lt!159793) lt!160786)))

(declare-fun bs!8284 () Bool)

(assert (= bs!8284 d!33950))

(declare-fun m!158835 () Bool)

(assert (=> bs!8284 m!158835))

(assert (=> bs!8284 m!158097))

(declare-fun m!158837 () Bool)

(assert (=> bs!8284 m!158837))

(assert (=> bs!8284 m!158103))

(assert (=> bs!8284 m!158081))

(assert (=> b!107113 d!33950))

(declare-fun d!33952 () Bool)

(declare-fun e!70314 () Bool)

(assert (=> d!33952 e!70314))

(declare-fun res!88531 () Bool)

(assert (=> d!33952 (=> (not res!88531) (not e!70314))))

(declare-fun lt!160793 () (_ BitVec 64))

(declare-fun lt!160791 () (_ BitVec 64))

(declare-fun lt!160795 () (_ BitVec 64))

(assert (=> d!33952 (= res!88531 (= lt!160793 (bvsub lt!160791 lt!160795)))))

(assert (=> d!33952 (or (= (bvand lt!160791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!160795 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!160791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160791 lt!160795) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33952 (= lt!160795 (remainingBits!0 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))) ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159777))) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159777)))))))

(declare-fun lt!160790 () (_ BitVec 64))

(declare-fun lt!160794 () (_ BitVec 64))

(assert (=> d!33952 (= lt!160791 (bvmul lt!160790 lt!160794))))

(assert (=> d!33952 (or (= lt!160790 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!160794 (bvsdiv (bvmul lt!160790 lt!160794) lt!160790)))))

(assert (=> d!33952 (= lt!160794 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33952 (= lt!160790 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))))))

(assert (=> d!33952 (= lt!160793 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5141 (_2!4671 lt!159777))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5136 (_2!4671 lt!159777)))))))

(assert (=> d!33952 (invariant!0 (currentBit!5136 (_2!4671 lt!159777)) (currentByte!5141 (_2!4671 lt!159777)) (size!2241 (buf!2623 (_2!4671 lt!159777))))))

(assert (=> d!33952 (= (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159777))) (currentByte!5141 (_2!4671 lt!159777)) (currentBit!5136 (_2!4671 lt!159777))) lt!160793)))

(declare-fun b!107445 () Bool)

(declare-fun res!88532 () Bool)

(assert (=> b!107445 (=> (not res!88532) (not e!70314))))

(assert (=> b!107445 (= res!88532 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!160793))))

(declare-fun b!107446 () Bool)

(declare-fun lt!160792 () (_ BitVec 64))

(assert (=> b!107446 (= e!70314 (bvsle lt!160793 (bvmul lt!160792 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107446 (or (= lt!160792 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!160792 #b0000000000000000000000000000000000000000000000000000000000001000) lt!160792)))))

(assert (=> b!107446 (= lt!160792 ((_ sign_extend 32) (size!2241 (buf!2623 (_2!4671 lt!159777)))))))

(assert (= (and d!33952 res!88531) b!107445))

(assert (= (and b!107445 res!88532) b!107446))

(declare-fun m!158839 () Bool)

(assert (=> d!33952 m!158839))

(declare-fun m!158841 () Bool)

(assert (=> d!33952 m!158841))

(assert (=> b!107113 d!33952))

(declare-fun d!33954 () Bool)

(assert (=> d!33954 (= (invariant!0 (currentBit!5136 (_2!4671 lt!159798)) (currentByte!5141 (_2!4671 lt!159798)) (size!2241 (buf!2623 (_2!4671 lt!159798)))) (and (bvsge (currentBit!5136 (_2!4671 lt!159798)) #b00000000000000000000000000000000) (bvslt (currentBit!5136 (_2!4671 lt!159798)) #b00000000000000000000000000001000) (bvsge (currentByte!5141 (_2!4671 lt!159798)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5141 (_2!4671 lt!159798)) (size!2241 (buf!2623 (_2!4671 lt!159798)))) (and (= (currentBit!5136 (_2!4671 lt!159798)) #b00000000000000000000000000000000) (= (currentByte!5141 (_2!4671 lt!159798)) (size!2241 (buf!2623 (_2!4671 lt!159798))))))))))

(assert (=> b!107113 d!33954))

(declare-fun d!33956 () Bool)

(declare-fun e!70315 () Bool)

(assert (=> d!33956 e!70315))

(declare-fun res!88533 () Bool)

(assert (=> d!33956 (=> (not res!88533) (not e!70315))))

(declare-fun lt!160796 () BitStream!3956)

(declare-fun lt!160797 () (_ BitVec 64))

(assert (=> d!33956 (= res!88533 (= (bvadd lt!160797 (bvsub lt!159791 lt!159775)) (bitIndex!0 (size!2241 (buf!2623 lt!160796)) (currentByte!5141 lt!160796) (currentBit!5136 lt!160796))))))

(assert (=> d!33956 (or (not (= (bvand lt!160797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159791 lt!159775) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!160797 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!160797 (bvsub lt!159791 lt!159775)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33956 (= lt!160797 (bitIndex!0 (size!2241 (buf!2623 (_2!4673 lt!159781))) (currentByte!5141 (_2!4673 lt!159781)) (currentBit!5136 (_2!4673 lt!159781))))))

(assert (=> d!33956 (= lt!160796 (_2!4671 (moveBitIndex!0 (_2!4673 lt!159781) (bvsub lt!159791 lt!159775))))))

(assert (=> d!33956 (moveBitIndexPrecond!0 (_2!4673 lt!159781) (bvsub lt!159791 lt!159775))))

(assert (=> d!33956 (= (withMovedBitIndex!0 (_2!4673 lt!159781) (bvsub lt!159791 lt!159775)) lt!160796)))

(declare-fun b!107447 () Bool)

(assert (=> b!107447 (= e!70315 (= (size!2241 (buf!2623 (_2!4673 lt!159781))) (size!2241 (buf!2623 lt!160796))))))

(assert (= (and d!33956 res!88533) b!107447))

(declare-fun m!158843 () Bool)

(assert (=> d!33956 m!158843))

(declare-fun m!158845 () Bool)

(assert (=> d!33956 m!158845))

(declare-fun m!158847 () Bool)

(assert (=> d!33956 m!158847))

(declare-fun m!158849 () Bool)

(assert (=> d!33956 m!158849))

(assert (=> b!107113 d!33956))

(assert (=> b!107113 d!33756))

(declare-fun d!33958 () Bool)

(assert (=> d!33958 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!107112 d!33958))

(declare-fun d!33960 () Bool)

(assert (=> d!33960 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2241 (buf!2623 thiss!1305))) ((_ sign_extend 32) (currentByte!5141 thiss!1305)) ((_ sign_extend 32) (currentBit!5136 thiss!1305)) lt!159794) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2241 (buf!2623 thiss!1305))) ((_ sign_extend 32) (currentByte!5141 thiss!1305)) ((_ sign_extend 32) (currentBit!5136 thiss!1305))) lt!159794))))

(declare-fun bs!8285 () Bool)

(assert (= bs!8285 d!33960))

(assert (=> bs!8285 m!158147))

(assert (=> b!107111 d!33960))

(declare-fun d!33962 () Bool)

(assert (=> d!33962 (= (invariant!0 (currentBit!5136 thiss!1305) (currentByte!5141 thiss!1305) (size!2241 (buf!2623 (_2!4671 lt!159777)))) (and (bvsge (currentBit!5136 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5136 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5141 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5141 thiss!1305) (size!2241 (buf!2623 (_2!4671 lt!159777)))) (and (= (currentBit!5136 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5141 thiss!1305) (size!2241 (buf!2623 (_2!4671 lt!159777))))))))))

(assert (=> b!107105 d!33962))

(declare-fun d!33964 () Bool)

(declare-fun res!88536 () Bool)

(declare-fun e!70317 () Bool)

(assert (=> d!33964 (=> (not res!88536) (not e!70317))))

(assert (=> d!33964 (= res!88536 (= (size!2241 (buf!2623 thiss!1305)) (size!2241 (buf!2623 (_2!4671 lt!159798)))))))

(assert (=> d!33964 (= (isPrefixOf!0 thiss!1305 (_2!4671 lt!159798)) e!70317)))

(declare-fun b!107448 () Bool)

(declare-fun res!88534 () Bool)

(assert (=> b!107448 (=> (not res!88534) (not e!70317))))

(assert (=> b!107448 (= res!88534 (bvsle (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305)) (bitIndex!0 (size!2241 (buf!2623 (_2!4671 lt!159798))) (currentByte!5141 (_2!4671 lt!159798)) (currentBit!5136 (_2!4671 lt!159798)))))))

(declare-fun b!107449 () Bool)

(declare-fun e!70316 () Bool)

(assert (=> b!107449 (= e!70317 e!70316)))

(declare-fun res!88535 () Bool)

(assert (=> b!107449 (=> res!88535 e!70316)))

(assert (=> b!107449 (= res!88535 (= (size!2241 (buf!2623 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107450 () Bool)

(assert (=> b!107450 (= e!70316 (arrayBitRangesEq!0 (buf!2623 thiss!1305) (buf!2623 (_2!4671 lt!159798)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2241 (buf!2623 thiss!1305)) (currentByte!5141 thiss!1305) (currentBit!5136 thiss!1305))))))

(assert (= (and d!33964 res!88536) b!107448))

(assert (= (and b!107448 res!88534) b!107449))

(assert (= (and b!107449 (not res!88535)) b!107450))

(assert (=> b!107448 m!158061))

(assert (=> b!107448 m!158057))

(assert (=> b!107450 m!158061))

(assert (=> b!107450 m!158061))

(declare-fun m!158851 () Bool)

(assert (=> b!107450 m!158851))

(assert (=> b!107115 d!33964))

(declare-fun d!33966 () Bool)

(assert (=> d!33966 (= (array_inv!2043 (buf!2623 thiss!1305)) (bvsge (size!2241 (buf!2623 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!107114 d!33966))

(push 1)

(assert (not d!33952))

(assert (not d!33742))

(assert (not b!107162))

(assert (not d!33926))

(assert (not b!107387))

(assert (not d!33904))

(assert (not d!33912))

(assert (not b!107175))

(assert (not b!107390))

(assert (not b!107182))

(assert (not b!107450))

(assert (not b!107184))

(assert (not b!107396))

(assert (not b!107120))

(assert (not d!33764))

(assert (not b!107437))

(assert (not d!33888))

(assert (not b!107172))

(assert (not d!33944))

(assert (not d!33758))

(assert (not d!33960))

(assert (not b!107385))

(assert (not b!107394))

(assert (not d!33948))

(assert (not d!33942))

(assert (not b!107393))

(assert (not b!107173))

(assert (not b!107389))

(assert (not d!33786))

(assert (not d!33930))

(assert (not b!107158))

(assert (not bm!1356))

(assert (not d!33902))

(assert (not b!107386))

(assert (not d!33762))

(assert (not d!33956))

(assert (not b!107433))

