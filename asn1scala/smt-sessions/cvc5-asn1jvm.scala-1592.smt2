; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45306 () Bool)

(assert start!45306)

(declare-fun b!219792 () Bool)

(declare-fun res!185181 () Bool)

(declare-fun e!149238 () Bool)

(assert (=> b!219792 (=> res!185181 e!149238)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!347710 () (_ BitVec 64))

(declare-datatypes ((array!10670 0))(
  ( (array!10671 (arr!5617 (Array (_ BitVec 32) (_ BitVec 8))) (size!4687 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8482 0))(
  ( (BitStream!8483 (buf!5234 array!10670) (currentByte!9833 (_ BitVec 32)) (currentBit!9828 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15571 0))(
  ( (Unit!15572) )
))
(declare-datatypes ((tuple2!18758 0))(
  ( (tuple2!18759 (_1!10037 Unit!15571) (_2!10037 BitStream!8482)) )
))
(declare-fun lt!347691 () tuple2!18758)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!8482)

(declare-fun lt!347711 () (_ BitVec 64))

(assert (=> b!219792 (= res!185181 (or (not (= (size!4687 (buf!5234 (_2!10037 lt!347691))) (size!4687 (buf!5234 thiss!1204)))) (not (= lt!347710 (bvsub (bvadd lt!347711 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!219793 () Bool)

(declare-fun res!185190 () Bool)

(declare-fun e!149243 () Bool)

(assert (=> b!219793 (=> (not res!185190) (not e!149243))))

(declare-datatypes ((tuple2!18760 0))(
  ( (tuple2!18761 (_1!10038 BitStream!8482) (_2!10038 BitStream!8482)) )
))
(declare-fun lt!347698 () tuple2!18760)

(declare-fun lt!347694 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8482 (_ BitVec 64)) BitStream!8482)

(assert (=> b!219793 (= res!185190 (= (_1!10038 lt!347698) (withMovedBitIndex!0 (_2!10038 lt!347698) (bvsub lt!347694 lt!347710))))))

(declare-fun b!219794 () Bool)

(declare-fun res!185191 () Bool)

(assert (=> b!219794 (=> res!185191 e!149238)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219794 (= res!185191 (not (invariant!0 (currentBit!9828 (_2!10037 lt!347691)) (currentByte!9833 (_2!10037 lt!347691)) (size!4687 (buf!5234 (_2!10037 lt!347691))))))))

(declare-fun b!219795 () Bool)

(declare-fun e!149235 () Bool)

(assert (=> b!219795 (= e!149235 e!149238)))

(declare-fun res!185192 () Bool)

(assert (=> b!219795 (=> res!185192 e!149238)))

(assert (=> b!219795 (= res!185192 (not (= lt!347710 (bvsub (bvsub (bvadd lt!347694 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!219795 (= lt!347710 (bitIndex!0 (size!4687 (buf!5234 (_2!10037 lt!347691))) (currentByte!9833 (_2!10037 lt!347691)) (currentBit!9828 (_2!10037 lt!347691))))))

(declare-fun isPrefixOf!0 (BitStream!8482 BitStream!8482) Bool)

(assert (=> b!219795 (isPrefixOf!0 thiss!1204 (_2!10037 lt!347691))))

(declare-fun lt!347705 () Unit!15571)

(declare-fun lt!347696 () tuple2!18758)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8482 BitStream!8482 BitStream!8482) Unit!15571)

(assert (=> b!219795 (= lt!347705 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!10037 lt!347696) (_2!10037 lt!347691)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8482 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18758)

(assert (=> b!219795 (= lt!347691 (appendBitsLSBFirstLoopTR!0 (_2!10037 lt!347696) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!219796 () Bool)

(declare-fun res!185183 () Bool)

(declare-fun e!149244 () Bool)

(assert (=> b!219796 (=> res!185183 e!149244)))

(declare-datatypes ((tuple2!18762 0))(
  ( (tuple2!18763 (_1!10039 BitStream!8482) (_2!10039 (_ BitVec 64))) )
))
(declare-fun lt!347714 () tuple2!18762)

(declare-fun lt!347700 () tuple2!18760)

(assert (=> b!219796 (= res!185183 (not (= (bitIndex!0 (size!4687 (buf!5234 (_1!10039 lt!347714))) (currentByte!9833 (_1!10039 lt!347714)) (currentBit!9828 (_1!10039 lt!347714))) (bitIndex!0 (size!4687 (buf!5234 (_2!10038 lt!347700))) (currentByte!9833 (_2!10038 lt!347700)) (currentBit!9828 (_2!10038 lt!347700))))))))

(declare-fun b!219798 () Bool)

(assert (=> b!219798 (= e!149244 true)))

(declare-fun e!149231 () Bool)

(assert (=> b!219798 e!149231))

(declare-fun res!185187 () Bool)

(assert (=> b!219798 (=> (not res!185187) (not e!149231))))

(assert (=> b!219798 (= res!185187 (= (size!4687 (buf!5234 thiss!1204)) (size!4687 (buf!5234 (_2!10037 lt!347691)))))))

(declare-fun b!219799 () Bool)

(declare-fun e!149239 () Bool)

(declare-fun e!149233 () Bool)

(assert (=> b!219799 (= e!149239 e!149233)))

(declare-fun res!185175 () Bool)

(assert (=> b!219799 (=> (not res!185175) (not e!149233))))

(declare-datatypes ((tuple2!18764 0))(
  ( (tuple2!18765 (_1!10040 BitStream!8482) (_2!10040 Bool)) )
))
(declare-fun lt!347693 () tuple2!18764)

(declare-fun lt!347687 () Bool)

(assert (=> b!219799 (= res!185175 (and (= (_2!10040 lt!347693) lt!347687) (= (_1!10040 lt!347693) (_2!10037 lt!347696))))))

(declare-fun readBitPure!0 (BitStream!8482) tuple2!18764)

(declare-fun readerFrom!0 (BitStream!8482 (_ BitVec 32) (_ BitVec 32)) BitStream!8482)

(assert (=> b!219799 (= lt!347693 (readBitPure!0 (readerFrom!0 (_2!10037 lt!347696) (currentBit!9828 thiss!1204) (currentByte!9833 thiss!1204))))))

(declare-fun b!219800 () Bool)

(declare-fun e!149240 () Bool)

(assert (=> b!219800 (= e!149240 (not e!149235))))

(declare-fun res!185188 () Bool)

(assert (=> b!219800 (=> res!185188 e!149235)))

(assert (=> b!219800 (= res!185188 (not (= lt!347694 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!347711))))))

(assert (=> b!219800 (= lt!347694 (bitIndex!0 (size!4687 (buf!5234 (_2!10037 lt!347696))) (currentByte!9833 (_2!10037 lt!347696)) (currentBit!9828 (_2!10037 lt!347696))))))

(assert (=> b!219800 (= lt!347711 (bitIndex!0 (size!4687 (buf!5234 thiss!1204)) (currentByte!9833 thiss!1204) (currentBit!9828 thiss!1204)))))

(declare-fun e!149232 () Bool)

(assert (=> b!219800 e!149232))

(declare-fun res!185184 () Bool)

(assert (=> b!219800 (=> (not res!185184) (not e!149232))))

(assert (=> b!219800 (= res!185184 (= (size!4687 (buf!5234 thiss!1204)) (size!4687 (buf!5234 (_2!10037 lt!347696)))))))

(declare-fun appendBit!0 (BitStream!8482 Bool) tuple2!18758)

(assert (=> b!219800 (= lt!347696 (appendBit!0 thiss!1204 lt!347687))))

(declare-fun lt!347699 () (_ BitVec 64))

(assert (=> b!219800 (= lt!347687 (not (= (bvand v!189 lt!347699) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!219800 (= lt!347699 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!219801 () Bool)

(declare-fun e!149236 () Bool)

(assert (=> b!219801 (= e!149236 e!149244)))

(declare-fun res!185174 () Bool)

(assert (=> b!219801 (=> res!185174 e!149244)))

(declare-fun lt!347704 () BitStream!8482)

(assert (=> b!219801 (= res!185174 (not (= (_1!10038 lt!347698) lt!347704)))))

(assert (=> b!219801 e!149243))

(declare-fun res!185186 () Bool)

(assert (=> b!219801 (=> (not res!185186) (not e!149243))))

(declare-fun lt!347690 () tuple2!18762)

(assert (=> b!219801 (= res!185186 (and (= (_2!10039 lt!347714) (_2!10039 lt!347690)) (= (_1!10039 lt!347714) (_1!10039 lt!347690))))))

(declare-fun lt!347692 () (_ BitVec 64))

(declare-fun lt!347688 () Unit!15571)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15571)

(assert (=> b!219801 (= lt!347688 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!10038 lt!347700) nBits!348 i!590 lt!347692))))

(declare-fun lt!347703 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18762)

(assert (=> b!219801 (= lt!347690 (readNBitsLSBFirstsLoopPure!0 lt!347704 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!347703))))

(assert (=> b!219801 (= lt!347704 (withMovedBitIndex!0 (_1!10038 lt!347700) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!219802 () Bool)

(declare-fun e!149237 () Bool)

(declare-fun array_inv!4428 (array!10670) Bool)

(assert (=> b!219802 (= e!149237 (array_inv!4428 (buf!5234 thiss!1204)))))

(declare-fun b!219803 () Bool)

(assert (=> b!219803 (= e!149231 (= (_1!10039 lt!347714) (_2!10038 lt!347700)))))

(declare-fun b!219804 () Bool)

(declare-fun res!185180 () Bool)

(assert (=> b!219804 (=> res!185180 e!149238)))

(assert (=> b!219804 (= res!185180 (not (isPrefixOf!0 thiss!1204 (_2!10037 lt!347696))))))

(declare-fun b!219805 () Bool)

(declare-fun e!149241 () Bool)

(assert (=> b!219805 (= e!149241 e!149240)))

(declare-fun res!185178 () Bool)

(assert (=> b!219805 (=> (not res!185178) (not e!149240))))

(declare-fun lt!347701 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!219805 (= res!185178 (validate_offset_bits!1 ((_ sign_extend 32) (size!4687 (buf!5234 thiss!1204))) ((_ sign_extend 32) (currentByte!9833 thiss!1204)) ((_ sign_extend 32) (currentBit!9828 thiss!1204)) lt!347701))))

(assert (=> b!219805 (= lt!347701 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!219806 () Bool)

(declare-fun res!185177 () Bool)

(assert (=> b!219806 (=> (not res!185177) (not e!149240))))

(assert (=> b!219806 (= res!185177 (invariant!0 (currentBit!9828 thiss!1204) (currentByte!9833 thiss!1204) (size!4687 (buf!5234 thiss!1204))))))

(declare-fun b!219807 () Bool)

(declare-fun res!185185 () Bool)

(assert (=> b!219807 (=> res!185185 e!149238)))

(assert (=> b!219807 (= res!185185 (not (isPrefixOf!0 (_2!10037 lt!347696) (_2!10037 lt!347691))))))

(declare-fun b!219808 () Bool)

(declare-fun res!185172 () Bool)

(assert (=> b!219808 (=> (not res!185172) (not e!149240))))

(assert (=> b!219808 (= res!185172 (not (= i!590 nBits!348)))))

(declare-fun b!219809 () Bool)

(declare-fun res!185195 () Bool)

(assert (=> b!219809 (=> (not res!185195) (not e!149239))))

(assert (=> b!219809 (= res!185195 (isPrefixOf!0 thiss!1204 (_2!10037 lt!347696)))))

(declare-fun b!219810 () Bool)

(declare-fun lt!347695 () (_ BitVec 64))

(assert (=> b!219810 (= e!149233 (= (bitIndex!0 (size!4687 (buf!5234 (_1!10040 lt!347693))) (currentByte!9833 (_1!10040 lt!347693)) (currentBit!9828 (_1!10040 lt!347693))) lt!347695))))

(declare-fun b!219811 () Bool)

(assert (=> b!219811 (= e!149238 e!149236)))

(declare-fun res!185194 () Bool)

(assert (=> b!219811 (=> res!185194 e!149236)))

(declare-fun lt!347708 () tuple2!18762)

(assert (=> b!219811 (= res!185194 (not (= (_1!10039 lt!347708) (_2!10038 lt!347698))))))

(assert (=> b!219811 (= lt!347708 (readNBitsLSBFirstsLoopPure!0 (_1!10038 lt!347698) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!347703))))

(declare-fun lt!347689 () (_ BitVec 64))

(assert (=> b!219811 (validate_offset_bits!1 ((_ sign_extend 32) (size!4687 (buf!5234 (_2!10037 lt!347691)))) ((_ sign_extend 32) (currentByte!9833 (_2!10037 lt!347696))) ((_ sign_extend 32) (currentBit!9828 (_2!10037 lt!347696))) lt!347689)))

(declare-fun lt!347686 () Unit!15571)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8482 array!10670 (_ BitVec 64)) Unit!15571)

(assert (=> b!219811 (= lt!347686 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!10037 lt!347696) (buf!5234 (_2!10037 lt!347691)) lt!347689))))

(assert (=> b!219811 (= lt!347689 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!347707 () tuple2!18764)

(assert (=> b!219811 (= lt!347703 (bvor lt!347692 (ite (_2!10040 lt!347707) lt!347699 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!219811 (= lt!347714 (readNBitsLSBFirstsLoopPure!0 (_1!10038 lt!347700) nBits!348 i!590 lt!347692))))

(assert (=> b!219811 (validate_offset_bits!1 ((_ sign_extend 32) (size!4687 (buf!5234 (_2!10037 lt!347691)))) ((_ sign_extend 32) (currentByte!9833 thiss!1204)) ((_ sign_extend 32) (currentBit!9828 thiss!1204)) lt!347701)))

(declare-fun lt!347712 () Unit!15571)

(assert (=> b!219811 (= lt!347712 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5234 (_2!10037 lt!347691)) lt!347701))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!219811 (= lt!347692 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!219811 (= (_2!10040 lt!347707) lt!347687)))

(assert (=> b!219811 (= lt!347707 (readBitPure!0 (_1!10038 lt!347700)))))

(declare-fun reader!0 (BitStream!8482 BitStream!8482) tuple2!18760)

(assert (=> b!219811 (= lt!347698 (reader!0 (_2!10037 lt!347696) (_2!10037 lt!347691)))))

(assert (=> b!219811 (= lt!347700 (reader!0 thiss!1204 (_2!10037 lt!347691)))))

(declare-fun e!149234 () Bool)

(assert (=> b!219811 e!149234))

(declare-fun res!185189 () Bool)

(assert (=> b!219811 (=> (not res!185189) (not e!149234))))

(declare-fun lt!347702 () tuple2!18764)

(declare-fun lt!347713 () tuple2!18764)

(assert (=> b!219811 (= res!185189 (= (bitIndex!0 (size!4687 (buf!5234 (_1!10040 lt!347702))) (currentByte!9833 (_1!10040 lt!347702)) (currentBit!9828 (_1!10040 lt!347702))) (bitIndex!0 (size!4687 (buf!5234 (_1!10040 lt!347713))) (currentByte!9833 (_1!10040 lt!347713)) (currentBit!9828 (_1!10040 lt!347713)))))))

(declare-fun lt!347697 () Unit!15571)

(declare-fun lt!347706 () BitStream!8482)

(declare-fun readBitPrefixLemma!0 (BitStream!8482 BitStream!8482) Unit!15571)

(assert (=> b!219811 (= lt!347697 (readBitPrefixLemma!0 lt!347706 (_2!10037 lt!347691)))))

(assert (=> b!219811 (= lt!347713 (readBitPure!0 (BitStream!8483 (buf!5234 (_2!10037 lt!347691)) (currentByte!9833 thiss!1204) (currentBit!9828 thiss!1204))))))

(assert (=> b!219811 (= lt!347702 (readBitPure!0 lt!347706))))

(declare-fun e!149242 () Bool)

(assert (=> b!219811 e!149242))

(declare-fun res!185182 () Bool)

(assert (=> b!219811 (=> (not res!185182) (not e!149242))))

(assert (=> b!219811 (= res!185182 (invariant!0 (currentBit!9828 thiss!1204) (currentByte!9833 thiss!1204) (size!4687 (buf!5234 (_2!10037 lt!347696)))))))

(assert (=> b!219811 (= lt!347706 (BitStream!8483 (buf!5234 (_2!10037 lt!347696)) (currentByte!9833 thiss!1204) (currentBit!9828 thiss!1204)))))

(declare-fun b!219812 () Bool)

(assert (=> b!219812 (= e!149232 e!149239)))

(declare-fun res!185173 () Bool)

(assert (=> b!219812 (=> (not res!185173) (not e!149239))))

(declare-fun lt!347709 () (_ BitVec 64))

(assert (=> b!219812 (= res!185173 (= lt!347695 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!347709)))))

(assert (=> b!219812 (= lt!347695 (bitIndex!0 (size!4687 (buf!5234 (_2!10037 lt!347696))) (currentByte!9833 (_2!10037 lt!347696)) (currentBit!9828 (_2!10037 lt!347696))))))

(assert (=> b!219812 (= lt!347709 (bitIndex!0 (size!4687 (buf!5234 thiss!1204)) (currentByte!9833 thiss!1204) (currentBit!9828 thiss!1204)))))

(declare-fun b!219813 () Bool)

(assert (=> b!219813 (= e!149242 (invariant!0 (currentBit!9828 thiss!1204) (currentByte!9833 thiss!1204) (size!4687 (buf!5234 (_2!10037 lt!347691)))))))

(declare-fun res!185193 () Bool)

(assert (=> start!45306 (=> (not res!185193) (not e!149241))))

(assert (=> start!45306 (= res!185193 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!45306 e!149241))

(assert (=> start!45306 true))

(declare-fun inv!12 (BitStream!8482) Bool)

(assert (=> start!45306 (and (inv!12 thiss!1204) e!149237)))

(declare-fun b!219797 () Bool)

(assert (=> b!219797 (= e!149243 (and (= lt!347711 (bvsub lt!347694 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!10038 lt!347698) lt!347704)) (= (_2!10039 lt!347714) (_2!10039 lt!347708)))))))

(declare-fun b!219814 () Bool)

(declare-fun res!185176 () Bool)

(assert (=> b!219814 (=> (not res!185176) (not e!149243))))

(assert (=> b!219814 (= res!185176 (= (_1!10038 lt!347700) (withMovedBitIndex!0 (_2!10038 lt!347700) (bvsub lt!347711 lt!347710))))))

(declare-fun b!219815 () Bool)

(assert (=> b!219815 (= e!149234 (= (_2!10040 lt!347702) (_2!10040 lt!347713)))))

(declare-fun b!219816 () Bool)

(declare-fun res!185179 () Bool)

(assert (=> b!219816 (=> (not res!185179) (not e!149231))))

(assert (=> b!219816 (= res!185179 (= (_2!10039 lt!347714) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (= (and start!45306 res!185193) b!219805))

(assert (= (and b!219805 res!185178) b!219806))

(assert (= (and b!219806 res!185177) b!219808))

(assert (= (and b!219808 res!185172) b!219800))

(assert (= (and b!219800 res!185184) b!219812))

(assert (= (and b!219812 res!185173) b!219809))

(assert (= (and b!219809 res!185195) b!219799))

(assert (= (and b!219799 res!185175) b!219810))

(assert (= (and b!219800 (not res!185188)) b!219795))

(assert (= (and b!219795 (not res!185192)) b!219794))

(assert (= (and b!219794 (not res!185191)) b!219792))

(assert (= (and b!219792 (not res!185181)) b!219807))

(assert (= (and b!219807 (not res!185185)) b!219804))

(assert (= (and b!219804 (not res!185180)) b!219811))

(assert (= (and b!219811 res!185182) b!219813))

(assert (= (and b!219811 res!185189) b!219815))

(assert (= (and b!219811 (not res!185194)) b!219801))

(assert (= (and b!219801 res!185186) b!219814))

(assert (= (and b!219814 res!185176) b!219793))

(assert (= (and b!219793 res!185190) b!219797))

(assert (= (and b!219801 (not res!185174)) b!219796))

(assert (= (and b!219796 (not res!185183)) b!219798))

(assert (= (and b!219798 res!185187) b!219816))

(assert (= (and b!219816 res!185179) b!219803))

(assert (= start!45306 b!219802))

(declare-fun m!338451 () Bool)

(assert (=> b!219804 m!338451))

(declare-fun m!338453 () Bool)

(assert (=> b!219816 m!338453))

(assert (=> b!219809 m!338451))

(declare-fun m!338455 () Bool)

(assert (=> start!45306 m!338455))

(declare-fun m!338457 () Bool)

(assert (=> b!219807 m!338457))

(declare-fun m!338459 () Bool)

(assert (=> b!219796 m!338459))

(declare-fun m!338461 () Bool)

(assert (=> b!219796 m!338461))

(declare-fun m!338463 () Bool)

(assert (=> b!219801 m!338463))

(declare-fun m!338465 () Bool)

(assert (=> b!219801 m!338465))

(declare-fun m!338467 () Bool)

(assert (=> b!219801 m!338467))

(declare-fun m!338469 () Bool)

(assert (=> b!219795 m!338469))

(declare-fun m!338471 () Bool)

(assert (=> b!219795 m!338471))

(declare-fun m!338473 () Bool)

(assert (=> b!219795 m!338473))

(declare-fun m!338475 () Bool)

(assert (=> b!219795 m!338475))

(declare-fun m!338477 () Bool)

(assert (=> b!219802 m!338477))

(declare-fun m!338479 () Bool)

(assert (=> b!219812 m!338479))

(declare-fun m!338481 () Bool)

(assert (=> b!219812 m!338481))

(declare-fun m!338483 () Bool)

(assert (=> b!219813 m!338483))

(declare-fun m!338485 () Bool)

(assert (=> b!219805 m!338485))

(declare-fun m!338487 () Bool)

(assert (=> b!219799 m!338487))

(assert (=> b!219799 m!338487))

(declare-fun m!338489 () Bool)

(assert (=> b!219799 m!338489))

(declare-fun m!338491 () Bool)

(assert (=> b!219811 m!338491))

(declare-fun m!338493 () Bool)

(assert (=> b!219811 m!338493))

(declare-fun m!338495 () Bool)

(assert (=> b!219811 m!338495))

(declare-fun m!338497 () Bool)

(assert (=> b!219811 m!338497))

(declare-fun m!338499 () Bool)

(assert (=> b!219811 m!338499))

(declare-fun m!338501 () Bool)

(assert (=> b!219811 m!338501))

(declare-fun m!338503 () Bool)

(assert (=> b!219811 m!338503))

(declare-fun m!338505 () Bool)

(assert (=> b!219811 m!338505))

(declare-fun m!338507 () Bool)

(assert (=> b!219811 m!338507))

(declare-fun m!338509 () Bool)

(assert (=> b!219811 m!338509))

(declare-fun m!338511 () Bool)

(assert (=> b!219811 m!338511))

(declare-fun m!338513 () Bool)

(assert (=> b!219811 m!338513))

(declare-fun m!338515 () Bool)

(assert (=> b!219811 m!338515))

(declare-fun m!338517 () Bool)

(assert (=> b!219811 m!338517))

(declare-fun m!338519 () Bool)

(assert (=> b!219811 m!338519))

(declare-fun m!338521 () Bool)

(assert (=> b!219811 m!338521))

(declare-fun m!338523 () Bool)

(assert (=> b!219810 m!338523))

(declare-fun m!338525 () Bool)

(assert (=> b!219794 m!338525))

(declare-fun m!338527 () Bool)

(assert (=> b!219793 m!338527))

(declare-fun m!338529 () Bool)

(assert (=> b!219806 m!338529))

(declare-fun m!338531 () Bool)

(assert (=> b!219814 m!338531))

(assert (=> b!219800 m!338479))

(assert (=> b!219800 m!338481))

(declare-fun m!338533 () Bool)

(assert (=> b!219800 m!338533))

(push 1)

(assert (not b!219814))

(assert (not b!219812))

(assert (not b!219805))

(assert (not b!219796))

(assert (not b!219813))

(assert (not b!219801))

(assert (not b!219794))

(assert (not b!219799))

(assert (not b!219810))

(assert (not b!219811))

(assert (not b!219804))

(assert (not b!219807))

(assert (not b!219800))

(assert (not b!219809))

(assert (not b!219806))

(assert (not b!219802))

(assert (not start!45306))

(assert (not b!219795))

(assert (not b!219793))

(assert (not b!219816))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

