; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40988 () Bool)

(assert start!40988)

(declare-fun b!189181 () Bool)

(declare-fun e!130640 () Bool)

(declare-fun e!130648 () Bool)

(assert (=> b!189181 (= e!130640 e!130648)))

(declare-fun res!157682 () Bool)

(assert (=> b!189181 (=> (not res!157682) (not e!130648))))

(declare-datatypes ((array!9878 0))(
  ( (array!9879 (arr!5284 (Array (_ BitVec 32) (_ BitVec 8))) (size!4354 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7816 0))(
  ( (BitStream!7817 (buf!4828 array!9878) (currentByte!9100 (_ BitVec 32)) (currentBit!9095 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16340 0))(
  ( (tuple2!16341 (_1!8815 BitStream!7816) (_2!8815 Bool)) )
))
(declare-fun lt!293845 () tuple2!16340)

(declare-datatypes ((Unit!13507 0))(
  ( (Unit!13508) )
))
(declare-datatypes ((tuple2!16342 0))(
  ( (tuple2!16343 (_1!8816 Unit!13507) (_2!8816 BitStream!7816)) )
))
(declare-fun lt!293856 () tuple2!16342)

(declare-fun lt!293860 () Bool)

(assert (=> b!189181 (= res!157682 (and (= (_2!8815 lt!293845) lt!293860) (= (_1!8815 lt!293845) (_2!8816 lt!293856))))))

(declare-fun thiss!1204 () BitStream!7816)

(declare-fun readBitPure!0 (BitStream!7816) tuple2!16340)

(declare-fun readerFrom!0 (BitStream!7816 (_ BitVec 32) (_ BitVec 32)) BitStream!7816)

(assert (=> b!189181 (= lt!293845 (readBitPure!0 (readerFrom!0 (_2!8816 lt!293856) (currentBit!9095 thiss!1204) (currentByte!9100 thiss!1204))))))

(declare-fun b!189182 () Bool)

(declare-fun res!157687 () Bool)

(assert (=> b!189182 (=> (not res!157687) (not e!130640))))

(declare-fun isPrefixOf!0 (BitStream!7816 BitStream!7816) Bool)

(assert (=> b!189182 (= res!157687 (isPrefixOf!0 thiss!1204 (_2!8816 lt!293856)))))

(declare-fun b!189183 () Bool)

(declare-fun res!157697 () Bool)

(declare-fun e!130641 () Bool)

(assert (=> b!189183 (=> res!157697 e!130641)))

(declare-fun lt!293847 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!293842 () tuple2!16342)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!293832 () (_ BitVec 64))

(assert (=> b!189183 (= res!157697 (or (not (= (size!4354 (buf!4828 (_2!8816 lt!293842))) (size!4354 (buf!4828 thiss!1204)))) (not (= lt!293847 (bvsub (bvadd lt!293832 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!189184 () Bool)

(declare-fun e!130637 () Bool)

(declare-fun lt!293833 () tuple2!16340)

(declare-fun lt!293850 () tuple2!16340)

(assert (=> b!189184 (= e!130637 (= (_2!8815 lt!293833) (_2!8815 lt!293850)))))

(declare-fun b!189185 () Bool)

(declare-fun e!130647 () Bool)

(assert (=> b!189185 (= e!130647 e!130641)))

(declare-fun res!157685 () Bool)

(assert (=> b!189185 (=> res!157685 e!130641)))

(declare-fun lt!293843 () (_ BitVec 64))

(assert (=> b!189185 (= res!157685 (not (= lt!293847 (bvsub (bvsub (bvadd lt!293843 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189185 (= lt!293847 (bitIndex!0 (size!4354 (buf!4828 (_2!8816 lt!293842))) (currentByte!9100 (_2!8816 lt!293842)) (currentBit!9095 (_2!8816 lt!293842))))))

(assert (=> b!189185 (isPrefixOf!0 thiss!1204 (_2!8816 lt!293842))))

(declare-fun lt!293858 () Unit!13507)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7816 BitStream!7816 BitStream!7816) Unit!13507)

(assert (=> b!189185 (= lt!293858 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8816 lt!293856) (_2!8816 lt!293842)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7816 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16342)

(assert (=> b!189185 (= lt!293842 (appendBitsLSBFirstLoopTR!0 (_2!8816 lt!293856) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!189186 () Bool)

(declare-fun e!130636 () Bool)

(assert (=> b!189186 (= e!130636 (not e!130647))))

(declare-fun res!157695 () Bool)

(assert (=> b!189186 (=> res!157695 e!130647)))

(assert (=> b!189186 (= res!157695 (not (= lt!293843 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293832))))))

(assert (=> b!189186 (= lt!293843 (bitIndex!0 (size!4354 (buf!4828 (_2!8816 lt!293856))) (currentByte!9100 (_2!8816 lt!293856)) (currentBit!9095 (_2!8816 lt!293856))))))

(assert (=> b!189186 (= lt!293832 (bitIndex!0 (size!4354 (buf!4828 thiss!1204)) (currentByte!9100 thiss!1204) (currentBit!9095 thiss!1204)))))

(declare-fun e!130644 () Bool)

(assert (=> b!189186 e!130644))

(declare-fun res!157701 () Bool)

(assert (=> b!189186 (=> (not res!157701) (not e!130644))))

(assert (=> b!189186 (= res!157701 (= (size!4354 (buf!4828 thiss!1204)) (size!4354 (buf!4828 (_2!8816 lt!293856)))))))

(declare-fun appendBit!0 (BitStream!7816 Bool) tuple2!16342)

(assert (=> b!189186 (= lt!293856 (appendBit!0 thiss!1204 lt!293860))))

(declare-fun lt!293853 () (_ BitVec 64))

(assert (=> b!189186 (= lt!293860 (not (= (bvand v!189 lt!293853) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189186 (= lt!293853 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!189187 () Bool)

(declare-fun res!157681 () Bool)

(assert (=> b!189187 (=> res!157681 e!130641)))

(assert (=> b!189187 (= res!157681 (not (isPrefixOf!0 thiss!1204 (_2!8816 lt!293856))))))

(declare-fun b!189188 () Bool)

(declare-fun res!157696 () Bool)

(assert (=> b!189188 (=> res!157696 e!130641)))

(assert (=> b!189188 (= res!157696 (not (isPrefixOf!0 (_2!8816 lt!293856) (_2!8816 lt!293842))))))

(declare-fun b!189189 () Bool)

(declare-fun e!130638 () Bool)

(declare-fun e!130649 () Bool)

(assert (=> b!189189 (= e!130638 e!130649)))

(declare-fun res!157690 () Bool)

(assert (=> b!189189 (=> res!157690 e!130649)))

(declare-datatypes ((tuple2!16344 0))(
  ( (tuple2!16345 (_1!8817 BitStream!7816) (_2!8817 BitStream!7816)) )
))
(declare-fun lt!293848 () tuple2!16344)

(declare-fun lt!293851 () BitStream!7816)

(assert (=> b!189189 (= res!157690 (not (= (_1!8817 lt!293848) lt!293851)))))

(declare-fun e!130642 () Bool)

(assert (=> b!189189 e!130642))

(declare-fun res!157698 () Bool)

(assert (=> b!189189 (=> (not res!157698) (not e!130642))))

(declare-datatypes ((tuple2!16346 0))(
  ( (tuple2!16347 (_1!8818 BitStream!7816) (_2!8818 (_ BitVec 64))) )
))
(declare-fun lt!293835 () tuple2!16346)

(declare-fun lt!293857 () tuple2!16346)

(assert (=> b!189189 (= res!157698 (and (= (_2!8818 lt!293835) (_2!8818 lt!293857)) (= (_1!8818 lt!293835) (_1!8818 lt!293857))))))

(declare-fun lt!293849 () tuple2!16344)

(declare-fun lt!293854 () Unit!13507)

(declare-fun lt!293838 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13507)

(assert (=> b!189189 (= lt!293854 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8817 lt!293849) nBits!348 i!590 lt!293838))))

(declare-fun lt!293852 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16346)

(assert (=> b!189189 (= lt!293857 (readNBitsLSBFirstsLoopPure!0 lt!293851 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293852))))

(declare-fun withMovedBitIndex!0 (BitStream!7816 (_ BitVec 64)) BitStream!7816)

(assert (=> b!189189 (= lt!293851 (withMovedBitIndex!0 (_1!8817 lt!293849) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!189190 () Bool)

(declare-fun res!157684 () Bool)

(assert (=> b!189190 (=> res!157684 e!130641)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!189190 (= res!157684 (not (invariant!0 (currentBit!9095 (_2!8816 lt!293842)) (currentByte!9100 (_2!8816 lt!293842)) (size!4354 (buf!4828 (_2!8816 lt!293842))))))))

(declare-fun b!189191 () Bool)

(assert (=> b!189191 (= e!130649 (bvsle i!590 #b00000000000000000000000001000000))))

(assert (=> b!189191 (= (size!4354 (buf!4828 thiss!1204)) (size!4354 (buf!4828 (_2!8816 lt!293842))))))

(declare-fun b!189192 () Bool)

(declare-fun res!157693 () Bool)

(assert (=> b!189192 (=> (not res!157693) (not e!130636))))

(assert (=> b!189192 (= res!157693 (not (= i!590 nBits!348)))))

(declare-fun b!189193 () Bool)

(declare-fun lt!293859 () (_ BitVec 64))

(assert (=> b!189193 (= e!130648 (= (bitIndex!0 (size!4354 (buf!4828 (_1!8815 lt!293845))) (currentByte!9100 (_1!8815 lt!293845)) (currentBit!9095 (_1!8815 lt!293845))) lt!293859))))

(declare-fun lt!293836 () tuple2!16346)

(declare-fun b!189194 () Bool)

(assert (=> b!189194 (= e!130642 (and (= lt!293832 (bvsub lt!293843 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8817 lt!293848) lt!293851)) (= (_2!8818 lt!293835) (_2!8818 lt!293836)))))))

(declare-fun res!157683 () Bool)

(declare-fun e!130639 () Bool)

(assert (=> start!40988 (=> (not res!157683) (not e!130639))))

(assert (=> start!40988 (= res!157683 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40988 e!130639))

(assert (=> start!40988 true))

(declare-fun e!130643 () Bool)

(declare-fun inv!12 (BitStream!7816) Bool)

(assert (=> start!40988 (and (inv!12 thiss!1204) e!130643)))

(declare-fun b!189195 () Bool)

(declare-fun array_inv!4095 (array!9878) Bool)

(assert (=> b!189195 (= e!130643 (array_inv!4095 (buf!4828 thiss!1204)))))

(declare-fun b!189196 () Bool)

(assert (=> b!189196 (= e!130644 e!130640)))

(declare-fun res!157699 () Bool)

(assert (=> b!189196 (=> (not res!157699) (not e!130640))))

(declare-fun lt!293837 () (_ BitVec 64))

(assert (=> b!189196 (= res!157699 (= lt!293859 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!293837)))))

(assert (=> b!189196 (= lt!293859 (bitIndex!0 (size!4354 (buf!4828 (_2!8816 lt!293856))) (currentByte!9100 (_2!8816 lt!293856)) (currentBit!9095 (_2!8816 lt!293856))))))

(assert (=> b!189196 (= lt!293837 (bitIndex!0 (size!4354 (buf!4828 thiss!1204)) (currentByte!9100 thiss!1204) (currentBit!9095 thiss!1204)))))

(declare-fun b!189197 () Bool)

(declare-fun res!157692 () Bool)

(assert (=> b!189197 (=> (not res!157692) (not e!130642))))

(assert (=> b!189197 (= res!157692 (= (_1!8817 lt!293848) (withMovedBitIndex!0 (_2!8817 lt!293848) (bvsub lt!293843 lt!293847))))))

(declare-fun b!189198 () Bool)

(assert (=> b!189198 (= e!130639 e!130636)))

(declare-fun res!157689 () Bool)

(assert (=> b!189198 (=> (not res!157689) (not e!130636))))

(declare-fun lt!293846 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!189198 (= res!157689 (validate_offset_bits!1 ((_ sign_extend 32) (size!4354 (buf!4828 thiss!1204))) ((_ sign_extend 32) (currentByte!9100 thiss!1204)) ((_ sign_extend 32) (currentBit!9095 thiss!1204)) lt!293846))))

(assert (=> b!189198 (= lt!293846 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!189199 () Bool)

(declare-fun res!157688 () Bool)

(assert (=> b!189199 (=> (not res!157688) (not e!130636))))

(assert (=> b!189199 (= res!157688 (invariant!0 (currentBit!9095 thiss!1204) (currentByte!9100 thiss!1204) (size!4354 (buf!4828 thiss!1204))))))

(declare-fun b!189200 () Bool)

(declare-fun res!157700 () Bool)

(assert (=> b!189200 (=> (not res!157700) (not e!130642))))

(assert (=> b!189200 (= res!157700 (= (_1!8817 lt!293849) (withMovedBitIndex!0 (_2!8817 lt!293849) (bvsub lt!293832 lt!293847))))))

(declare-fun b!189201 () Bool)

(declare-fun res!157680 () Bool)

(assert (=> b!189201 (=> res!157680 e!130649)))

(assert (=> b!189201 (= res!157680 (not (= (bitIndex!0 (size!4354 (buf!4828 (_1!8818 lt!293835))) (currentByte!9100 (_1!8818 lt!293835)) (currentBit!9095 (_1!8818 lt!293835))) (bitIndex!0 (size!4354 (buf!4828 (_2!8817 lt!293849))) (currentByte!9100 (_2!8817 lt!293849)) (currentBit!9095 (_2!8817 lt!293849))))))))

(declare-fun b!189202 () Bool)

(declare-fun e!130645 () Bool)

(assert (=> b!189202 (= e!130645 (invariant!0 (currentBit!9095 thiss!1204) (currentByte!9100 thiss!1204) (size!4354 (buf!4828 (_2!8816 lt!293842)))))))

(declare-fun b!189203 () Bool)

(assert (=> b!189203 (= e!130641 e!130638)))

(declare-fun res!157686 () Bool)

(assert (=> b!189203 (=> res!157686 e!130638)))

(assert (=> b!189203 (= res!157686 (not (= (_1!8818 lt!293836) (_2!8817 lt!293848))))))

(assert (=> b!189203 (= lt!293836 (readNBitsLSBFirstsLoopPure!0 (_1!8817 lt!293848) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!293852))))

(declare-fun lt!293844 () (_ BitVec 64))

(assert (=> b!189203 (validate_offset_bits!1 ((_ sign_extend 32) (size!4354 (buf!4828 (_2!8816 lt!293842)))) ((_ sign_extend 32) (currentByte!9100 (_2!8816 lt!293856))) ((_ sign_extend 32) (currentBit!9095 (_2!8816 lt!293856))) lt!293844)))

(declare-fun lt!293841 () Unit!13507)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7816 array!9878 (_ BitVec 64)) Unit!13507)

(assert (=> b!189203 (= lt!293841 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8816 lt!293856) (buf!4828 (_2!8816 lt!293842)) lt!293844))))

(assert (=> b!189203 (= lt!293844 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!293834 () tuple2!16340)

(assert (=> b!189203 (= lt!293852 (bvor lt!293838 (ite (_2!8815 lt!293834) lt!293853 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!189203 (= lt!293835 (readNBitsLSBFirstsLoopPure!0 (_1!8817 lt!293849) nBits!348 i!590 lt!293838))))

(assert (=> b!189203 (validate_offset_bits!1 ((_ sign_extend 32) (size!4354 (buf!4828 (_2!8816 lt!293842)))) ((_ sign_extend 32) (currentByte!9100 thiss!1204)) ((_ sign_extend 32) (currentBit!9095 thiss!1204)) lt!293846)))

(declare-fun lt!293839 () Unit!13507)

(assert (=> b!189203 (= lt!293839 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4828 (_2!8816 lt!293842)) lt!293846))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!189203 (= lt!293838 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!189203 (= (_2!8815 lt!293834) lt!293860)))

(assert (=> b!189203 (= lt!293834 (readBitPure!0 (_1!8817 lt!293849)))))

(declare-fun reader!0 (BitStream!7816 BitStream!7816) tuple2!16344)

(assert (=> b!189203 (= lt!293848 (reader!0 (_2!8816 lt!293856) (_2!8816 lt!293842)))))

(assert (=> b!189203 (= lt!293849 (reader!0 thiss!1204 (_2!8816 lt!293842)))))

(assert (=> b!189203 e!130637))

(declare-fun res!157691 () Bool)

(assert (=> b!189203 (=> (not res!157691) (not e!130637))))

(assert (=> b!189203 (= res!157691 (= (bitIndex!0 (size!4354 (buf!4828 (_1!8815 lt!293833))) (currentByte!9100 (_1!8815 lt!293833)) (currentBit!9095 (_1!8815 lt!293833))) (bitIndex!0 (size!4354 (buf!4828 (_1!8815 lt!293850))) (currentByte!9100 (_1!8815 lt!293850)) (currentBit!9095 (_1!8815 lt!293850)))))))

(declare-fun lt!293840 () Unit!13507)

(declare-fun lt!293855 () BitStream!7816)

(declare-fun readBitPrefixLemma!0 (BitStream!7816 BitStream!7816) Unit!13507)

(assert (=> b!189203 (= lt!293840 (readBitPrefixLemma!0 lt!293855 (_2!8816 lt!293842)))))

(assert (=> b!189203 (= lt!293850 (readBitPure!0 (BitStream!7817 (buf!4828 (_2!8816 lt!293842)) (currentByte!9100 thiss!1204) (currentBit!9095 thiss!1204))))))

(assert (=> b!189203 (= lt!293833 (readBitPure!0 lt!293855))))

(assert (=> b!189203 e!130645))

(declare-fun res!157694 () Bool)

(assert (=> b!189203 (=> (not res!157694) (not e!130645))))

(assert (=> b!189203 (= res!157694 (invariant!0 (currentBit!9095 thiss!1204) (currentByte!9100 thiss!1204) (size!4354 (buf!4828 (_2!8816 lt!293856)))))))

(assert (=> b!189203 (= lt!293855 (BitStream!7817 (buf!4828 (_2!8816 lt!293856)) (currentByte!9100 thiss!1204) (currentBit!9095 thiss!1204)))))

(assert (= (and start!40988 res!157683) b!189198))

(assert (= (and b!189198 res!157689) b!189199))

(assert (= (and b!189199 res!157688) b!189192))

(assert (= (and b!189192 res!157693) b!189186))

(assert (= (and b!189186 res!157701) b!189196))

(assert (= (and b!189196 res!157699) b!189182))

(assert (= (and b!189182 res!157687) b!189181))

(assert (= (and b!189181 res!157682) b!189193))

(assert (= (and b!189186 (not res!157695)) b!189185))

(assert (= (and b!189185 (not res!157685)) b!189190))

(assert (= (and b!189190 (not res!157684)) b!189183))

(assert (= (and b!189183 (not res!157697)) b!189188))

(assert (= (and b!189188 (not res!157696)) b!189187))

(assert (= (and b!189187 (not res!157681)) b!189203))

(assert (= (and b!189203 res!157694) b!189202))

(assert (= (and b!189203 res!157691) b!189184))

(assert (= (and b!189203 (not res!157686)) b!189189))

(assert (= (and b!189189 res!157698) b!189200))

(assert (= (and b!189200 res!157700) b!189197))

(assert (= (and b!189197 res!157692) b!189194))

(assert (= (and b!189189 (not res!157690)) b!189201))

(assert (= (and b!189201 (not res!157680)) b!189191))

(assert (= start!40988 b!189195))

(declare-fun m!294143 () Bool)

(assert (=> b!189198 m!294143))

(declare-fun m!294145 () Bool)

(assert (=> b!189187 m!294145))

(declare-fun m!294147 () Bool)

(assert (=> b!189193 m!294147))

(declare-fun m!294149 () Bool)

(assert (=> b!189181 m!294149))

(assert (=> b!189181 m!294149))

(declare-fun m!294151 () Bool)

(assert (=> b!189181 m!294151))

(declare-fun m!294153 () Bool)

(assert (=> b!189200 m!294153))

(declare-fun m!294155 () Bool)

(assert (=> b!189195 m!294155))

(declare-fun m!294157 () Bool)

(assert (=> b!189203 m!294157))

(declare-fun m!294159 () Bool)

(assert (=> b!189203 m!294159))

(declare-fun m!294161 () Bool)

(assert (=> b!189203 m!294161))

(declare-fun m!294163 () Bool)

(assert (=> b!189203 m!294163))

(declare-fun m!294165 () Bool)

(assert (=> b!189203 m!294165))

(declare-fun m!294167 () Bool)

(assert (=> b!189203 m!294167))

(declare-fun m!294169 () Bool)

(assert (=> b!189203 m!294169))

(declare-fun m!294171 () Bool)

(assert (=> b!189203 m!294171))

(declare-fun m!294173 () Bool)

(assert (=> b!189203 m!294173))

(declare-fun m!294175 () Bool)

(assert (=> b!189203 m!294175))

(declare-fun m!294177 () Bool)

(assert (=> b!189203 m!294177))

(declare-fun m!294179 () Bool)

(assert (=> b!189203 m!294179))

(declare-fun m!294181 () Bool)

(assert (=> b!189203 m!294181))

(declare-fun m!294183 () Bool)

(assert (=> b!189203 m!294183))

(declare-fun m!294185 () Bool)

(assert (=> b!189203 m!294185))

(declare-fun m!294187 () Bool)

(assert (=> b!189203 m!294187))

(declare-fun m!294189 () Bool)

(assert (=> b!189185 m!294189))

(declare-fun m!294191 () Bool)

(assert (=> b!189185 m!294191))

(declare-fun m!294193 () Bool)

(assert (=> b!189185 m!294193))

(declare-fun m!294195 () Bool)

(assert (=> b!189185 m!294195))

(declare-fun m!294197 () Bool)

(assert (=> b!189199 m!294197))

(declare-fun m!294199 () Bool)

(assert (=> b!189186 m!294199))

(declare-fun m!294201 () Bool)

(assert (=> b!189186 m!294201))

(declare-fun m!294203 () Bool)

(assert (=> b!189186 m!294203))

(declare-fun m!294205 () Bool)

(assert (=> b!189197 m!294205))

(declare-fun m!294207 () Bool)

(assert (=> b!189189 m!294207))

(declare-fun m!294209 () Bool)

(assert (=> b!189189 m!294209))

(declare-fun m!294211 () Bool)

(assert (=> b!189189 m!294211))

(declare-fun m!294213 () Bool)

(assert (=> b!189202 m!294213))

(declare-fun m!294215 () Bool)

(assert (=> start!40988 m!294215))

(assert (=> b!189196 m!294199))

(assert (=> b!189196 m!294201))

(assert (=> b!189182 m!294145))

(declare-fun m!294217 () Bool)

(assert (=> b!189190 m!294217))

(declare-fun m!294219 () Bool)

(assert (=> b!189188 m!294219))

(declare-fun m!294221 () Bool)

(assert (=> b!189201 m!294221))

(declare-fun m!294223 () Bool)

(assert (=> b!189201 m!294223))

(push 1)

(assert (not b!189186))

(assert (not b!189197))

(assert (not b!189196))

(assert (not b!189203))

(assert (not b!189185))

(assert (not b!189195))

(assert (not b!189200))

(assert (not b!189201))

(assert (not b!189190))

(assert (not b!189182))

(assert (not b!189193))

(assert (not b!189187))

(assert (not b!189189))

(assert (not start!40988))

(assert (not b!189199))

(assert (not b!189198))

(assert (not b!189202))

(assert (not b!189181))

(assert (not b!189188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

