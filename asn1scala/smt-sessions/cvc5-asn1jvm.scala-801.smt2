; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23216 () Bool)

(assert start!23216)

(declare-fun b!117803 () Bool)

(declare-fun e!77215 () Bool)

(declare-fun e!77216 () Bool)

(assert (=> b!117803 (= e!77215 e!77216)))

(declare-fun res!97455 () Bool)

(assert (=> b!117803 (=> (not res!97455) (not e!77216))))

(declare-datatypes ((array!5294 0))(
  ( (array!5295 (arr!2994 (Array (_ BitVec 32) (_ BitVec 8))) (size!2401 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4276 0))(
  ( (BitStream!4277 (buf!2817 array!5294) (currentByte!5466 (_ BitVec 32)) (currentBit!5461 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7249 0))(
  ( (Unit!7250) )
))
(declare-datatypes ((tuple2!9832 0))(
  ( (tuple2!9833 (_1!5181 Unit!7249) (_2!5181 BitStream!4276)) )
))
(declare-fun lt!180753 () tuple2!9832)

(declare-fun lt!180760 () Bool)

(declare-datatypes ((tuple2!9834 0))(
  ( (tuple2!9835 (_1!5182 BitStream!4276) (_2!5182 Bool)) )
))
(declare-fun lt!180771 () tuple2!9834)

(assert (=> b!117803 (= res!97455 (and (= (_2!5182 lt!180771) lt!180760) (= (_1!5182 lt!180771) (_2!5181 lt!180753))))))

(declare-fun thiss!1305 () BitStream!4276)

(declare-fun readBitPure!0 (BitStream!4276) tuple2!9834)

(declare-fun readerFrom!0 (BitStream!4276 (_ BitVec 32) (_ BitVec 32)) BitStream!4276)

(assert (=> b!117803 (= lt!180771 (readBitPure!0 (readerFrom!0 (_2!5181 lt!180753) (currentBit!5461 thiss!1305) (currentByte!5466 thiss!1305))))))

(declare-fun b!117804 () Bool)

(declare-fun res!97462 () Bool)

(declare-fun e!77212 () Bool)

(assert (=> b!117804 (=> (not res!97462) (not e!77212))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117804 (= res!97462 (invariant!0 (currentBit!5461 thiss!1305) (currentByte!5466 thiss!1305) (size!2401 (buf!2817 (_2!5181 lt!180753)))))))

(declare-fun b!117805 () Bool)

(declare-fun res!97454 () Bool)

(declare-fun e!77213 () Bool)

(assert (=> b!117805 (=> (not res!97454) (not e!77213))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117805 (= res!97454 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117806 () Bool)

(declare-fun e!77214 () Bool)

(declare-fun array_inv!2203 (array!5294) Bool)

(assert (=> b!117806 (= e!77214 (array_inv!2203 (buf!2817 thiss!1305)))))

(declare-fun b!117807 () Bool)

(declare-fun lt!180769 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117807 (= e!77216 (= (bitIndex!0 (size!2401 (buf!2817 (_1!5182 lt!180771))) (currentByte!5466 (_1!5182 lt!180771)) (currentBit!5461 (_1!5182 lt!180771))) lt!180769))))

(declare-fun b!117808 () Bool)

(declare-fun e!77210 () Bool)

(assert (=> b!117808 (= e!77210 e!77213)))

(declare-fun res!97461 () Bool)

(assert (=> b!117808 (=> (not res!97461) (not e!77213))))

(declare-fun lt!180762 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117808 (= res!97461 (validate_offset_bits!1 ((_ sign_extend 32) (size!2401 (buf!2817 thiss!1305))) ((_ sign_extend 32) (currentByte!5466 thiss!1305)) ((_ sign_extend 32) (currentBit!5461 thiss!1305)) lt!180762))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!117808 (= lt!180762 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!97459 () Bool)

(assert (=> start!23216 (=> (not res!97459) (not e!77210))))

(assert (=> start!23216 (= res!97459 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23216 e!77210))

(assert (=> start!23216 true))

(declare-fun inv!12 (BitStream!4276) Bool)

(assert (=> start!23216 (and (inv!12 thiss!1305) e!77214)))

(declare-fun b!117809 () Bool)

(assert (=> b!117809 (= e!77213 (not true))))

(declare-datatypes ((tuple2!9836 0))(
  ( (tuple2!9837 (_1!5183 BitStream!4276) (_2!5183 BitStream!4276)) )
))
(declare-fun lt!180758 () tuple2!9836)

(declare-fun lt!180751 () tuple2!9834)

(declare-datatypes ((tuple2!9838 0))(
  ( (tuple2!9839 (_1!5184 BitStream!4276) (_2!5184 (_ BitVec 64))) )
))
(declare-fun lt!180755 () tuple2!9838)

(declare-fun lt!180768 () (_ BitVec 64))

(declare-fun lt!180761 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4276 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9838)

(assert (=> b!117809 (= lt!180755 (readNLeastSignificantBitsLoopPure!0 (_1!5183 lt!180758) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) (bvor lt!180761 (ite (_2!5182 lt!180751) lt!180768 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!180752 () tuple2!9832)

(declare-fun lt!180763 () (_ BitVec 64))

(assert (=> b!117809 (validate_offset_bits!1 ((_ sign_extend 32) (size!2401 (buf!2817 (_2!5181 lt!180752)))) ((_ sign_extend 32) (currentByte!5466 (_2!5181 lt!180753))) ((_ sign_extend 32) (currentBit!5461 (_2!5181 lt!180753))) lt!180763)))

(declare-fun lt!180770 () Unit!7249)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4276 array!5294 (_ BitVec 64)) Unit!7249)

(assert (=> b!117809 (= lt!180770 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5181 lt!180753) (buf!2817 (_2!5181 lt!180752)) lt!180763))))

(assert (=> b!117809 (= lt!180763 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!180759 () tuple2!9838)

(declare-fun lt!180754 () tuple2!9836)

(assert (=> b!117809 (= lt!180759 (readNLeastSignificantBitsLoopPure!0 (_1!5183 lt!180754) nBits!396 i!615 lt!180761))))

(assert (=> b!117809 (validate_offset_bits!1 ((_ sign_extend 32) (size!2401 (buf!2817 (_2!5181 lt!180752)))) ((_ sign_extend 32) (currentByte!5466 thiss!1305)) ((_ sign_extend 32) (currentBit!5461 thiss!1305)) lt!180762)))

(declare-fun lt!180765 () Unit!7249)

(assert (=> b!117809 (= lt!180765 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2817 (_2!5181 lt!180752)) lt!180762))))

(assert (=> b!117809 (= lt!180761 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!117809 (= (_2!5182 lt!180751) lt!180760)))

(assert (=> b!117809 (= lt!180751 (readBitPure!0 (_1!5183 lt!180754)))))

(declare-fun reader!0 (BitStream!4276 BitStream!4276) tuple2!9836)

(assert (=> b!117809 (= lt!180758 (reader!0 (_2!5181 lt!180753) (_2!5181 lt!180752)))))

(assert (=> b!117809 (= lt!180754 (reader!0 thiss!1305 (_2!5181 lt!180752)))))

(declare-fun e!77217 () Bool)

(assert (=> b!117809 e!77217))

(declare-fun res!97456 () Bool)

(assert (=> b!117809 (=> (not res!97456) (not e!77217))))

(declare-fun lt!180767 () tuple2!9834)

(declare-fun lt!180757 () tuple2!9834)

(assert (=> b!117809 (= res!97456 (= (bitIndex!0 (size!2401 (buf!2817 (_1!5182 lt!180767))) (currentByte!5466 (_1!5182 lt!180767)) (currentBit!5461 (_1!5182 lt!180767))) (bitIndex!0 (size!2401 (buf!2817 (_1!5182 lt!180757))) (currentByte!5466 (_1!5182 lt!180757)) (currentBit!5461 (_1!5182 lt!180757)))))))

(declare-fun lt!180750 () Unit!7249)

(declare-fun lt!180756 () BitStream!4276)

(declare-fun readBitPrefixLemma!0 (BitStream!4276 BitStream!4276) Unit!7249)

(assert (=> b!117809 (= lt!180750 (readBitPrefixLemma!0 lt!180756 (_2!5181 lt!180752)))))

(assert (=> b!117809 (= lt!180757 (readBitPure!0 (BitStream!4277 (buf!2817 (_2!5181 lt!180752)) (currentByte!5466 thiss!1305) (currentBit!5461 thiss!1305))))))

(assert (=> b!117809 (= lt!180767 (readBitPure!0 lt!180756))))

(assert (=> b!117809 (= lt!180756 (BitStream!4277 (buf!2817 (_2!5181 lt!180753)) (currentByte!5466 thiss!1305) (currentBit!5461 thiss!1305)))))

(assert (=> b!117809 e!77212))

(declare-fun res!97457 () Bool)

(assert (=> b!117809 (=> (not res!97457) (not e!77212))))

(declare-fun isPrefixOf!0 (BitStream!4276 BitStream!4276) Bool)

(assert (=> b!117809 (= res!97457 (isPrefixOf!0 thiss!1305 (_2!5181 lt!180752)))))

(declare-fun lt!180766 () Unit!7249)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4276 BitStream!4276 BitStream!4276) Unit!7249)

(assert (=> b!117809 (= lt!180766 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5181 lt!180753) (_2!5181 lt!180752)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4276 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9832)

(assert (=> b!117809 (= lt!180752 (appendNLeastSignificantBitsLoop!0 (_2!5181 lt!180753) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!77211 () Bool)

(assert (=> b!117809 e!77211))

(declare-fun res!97463 () Bool)

(assert (=> b!117809 (=> (not res!97463) (not e!77211))))

(assert (=> b!117809 (= res!97463 (= (size!2401 (buf!2817 thiss!1305)) (size!2401 (buf!2817 (_2!5181 lt!180753)))))))

(declare-fun appendBit!0 (BitStream!4276 Bool) tuple2!9832)

(assert (=> b!117809 (= lt!180753 (appendBit!0 thiss!1305 lt!180760))))

(assert (=> b!117809 (= lt!180760 (not (= (bvand v!199 lt!180768) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117809 (= lt!180768 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!117810 () Bool)

(declare-fun res!97458 () Bool)

(assert (=> b!117810 (=> (not res!97458) (not e!77215))))

(assert (=> b!117810 (= res!97458 (isPrefixOf!0 thiss!1305 (_2!5181 lt!180753)))))

(declare-fun b!117811 () Bool)

(assert (=> b!117811 (= e!77211 e!77215)))

(declare-fun res!97460 () Bool)

(assert (=> b!117811 (=> (not res!97460) (not e!77215))))

(declare-fun lt!180764 () (_ BitVec 64))

(assert (=> b!117811 (= res!97460 (= lt!180769 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!180764)))))

(assert (=> b!117811 (= lt!180769 (bitIndex!0 (size!2401 (buf!2817 (_2!5181 lt!180753))) (currentByte!5466 (_2!5181 lt!180753)) (currentBit!5461 (_2!5181 lt!180753))))))

(assert (=> b!117811 (= lt!180764 (bitIndex!0 (size!2401 (buf!2817 thiss!1305)) (currentByte!5466 thiss!1305) (currentBit!5461 thiss!1305)))))

(declare-fun b!117812 () Bool)

(declare-fun res!97464 () Bool)

(assert (=> b!117812 (=> (not res!97464) (not e!77213))))

(assert (=> b!117812 (= res!97464 (bvslt i!615 nBits!396))))

(declare-fun b!117813 () Bool)

(assert (=> b!117813 (= e!77212 (invariant!0 (currentBit!5461 thiss!1305) (currentByte!5466 thiss!1305) (size!2401 (buf!2817 (_2!5181 lt!180752)))))))

(declare-fun b!117814 () Bool)

(assert (=> b!117814 (= e!77217 (= (_2!5182 lt!180767) (_2!5182 lt!180757)))))

(assert (= (and start!23216 res!97459) b!117808))

(assert (= (and b!117808 res!97461) b!117805))

(assert (= (and b!117805 res!97454) b!117812))

(assert (= (and b!117812 res!97464) b!117809))

(assert (= (and b!117809 res!97463) b!117811))

(assert (= (and b!117811 res!97460) b!117810))

(assert (= (and b!117810 res!97458) b!117803))

(assert (= (and b!117803 res!97455) b!117807))

(assert (= (and b!117809 res!97457) b!117804))

(assert (= (and b!117804 res!97462) b!117813))

(assert (= (and b!117809 res!97456) b!117814))

(assert (= start!23216 b!117806))

(declare-fun m!176753 () Bool)

(assert (=> b!117813 m!176753))

(declare-fun m!176755 () Bool)

(assert (=> b!117809 m!176755))

(declare-fun m!176757 () Bool)

(assert (=> b!117809 m!176757))

(declare-fun m!176759 () Bool)

(assert (=> b!117809 m!176759))

(declare-fun m!176761 () Bool)

(assert (=> b!117809 m!176761))

(declare-fun m!176763 () Bool)

(assert (=> b!117809 m!176763))

(declare-fun m!176765 () Bool)

(assert (=> b!117809 m!176765))

(declare-fun m!176767 () Bool)

(assert (=> b!117809 m!176767))

(declare-fun m!176769 () Bool)

(assert (=> b!117809 m!176769))

(declare-fun m!176771 () Bool)

(assert (=> b!117809 m!176771))

(declare-fun m!176773 () Bool)

(assert (=> b!117809 m!176773))

(declare-fun m!176775 () Bool)

(assert (=> b!117809 m!176775))

(declare-fun m!176777 () Bool)

(assert (=> b!117809 m!176777))

(declare-fun m!176779 () Bool)

(assert (=> b!117809 m!176779))

(declare-fun m!176781 () Bool)

(assert (=> b!117809 m!176781))

(declare-fun m!176783 () Bool)

(assert (=> b!117809 m!176783))

(declare-fun m!176785 () Bool)

(assert (=> b!117809 m!176785))

(declare-fun m!176787 () Bool)

(assert (=> b!117809 m!176787))

(declare-fun m!176789 () Bool)

(assert (=> b!117809 m!176789))

(declare-fun m!176791 () Bool)

(assert (=> b!117809 m!176791))

(declare-fun m!176793 () Bool)

(assert (=> start!23216 m!176793))

(declare-fun m!176795 () Bool)

(assert (=> b!117810 m!176795))

(declare-fun m!176797 () Bool)

(assert (=> b!117807 m!176797))

(declare-fun m!176799 () Bool)

(assert (=> b!117803 m!176799))

(assert (=> b!117803 m!176799))

(declare-fun m!176801 () Bool)

(assert (=> b!117803 m!176801))

(declare-fun m!176803 () Bool)

(assert (=> b!117811 m!176803))

(declare-fun m!176805 () Bool)

(assert (=> b!117811 m!176805))

(declare-fun m!176807 () Bool)

(assert (=> b!117806 m!176807))

(declare-fun m!176809 () Bool)

(assert (=> b!117808 m!176809))

(declare-fun m!176811 () Bool)

(assert (=> b!117804 m!176811))

(declare-fun m!176813 () Bool)

(assert (=> b!117805 m!176813))

(push 1)

(assert (not b!117804))

(assert (not b!117810))

(assert (not b!117807))

(assert (not b!117813))

(assert (not b!117808))

