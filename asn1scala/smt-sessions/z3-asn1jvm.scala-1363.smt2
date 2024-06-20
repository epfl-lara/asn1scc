; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37766 () Bool)

(assert start!37766)

(declare-fun res!141884 () Bool)

(declare-fun e!119387 () Bool)

(assert (=> start!37766 (=> (not res!141884) (not e!119387))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37766 (= res!141884 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37766 e!119387))

(assert (=> start!37766 true))

(declare-datatypes ((array!9087 0))(
  ( (array!9088 (arr!4952 (Array (_ BitVec 32) (_ BitVec 8))) (size!4022 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7182 0))(
  ( (BitStream!7183 (buf!4465 array!9087) (currentByte!8470 (_ BitVec 32)) (currentBit!8465 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7182)

(declare-fun e!119388 () Bool)

(declare-fun inv!12 (BitStream!7182) Bool)

(assert (=> start!37766 (and (inv!12 bs!64) e!119388)))

(declare-fun b!171034 () Bool)

(declare-fun res!141885 () Bool)

(assert (=> b!171034 (=> (not res!141885) (not e!119387))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171034 (= res!141885 (validate_offset_bits!1 ((_ sign_extend 32) (size!4022 (buf!4465 bs!64))) ((_ sign_extend 32) (currentByte!8470 bs!64)) ((_ sign_extend 32) (currentBit!8465 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!171035 () Bool)

(assert (=> b!171035 (= e!119387 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))))))

(declare-fun lt!263668 () BitStream!7182)

(declare-fun withMovedBitIndex!0 (BitStream!7182 (_ BitVec 64)) BitStream!7182)

(assert (=> b!171035 (= lt!263668 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14698 0))(
  ( (tuple2!14699 (_1!7982 BitStream!7182) (_2!7982 Bool)) )
))
(declare-fun lt!263669 () tuple2!14698)

(declare-fun readBitPure!0 (BitStream!7182) tuple2!14698)

(assert (=> b!171035 (= lt!263669 (readBitPure!0 bs!64))))

(declare-fun lt!263667 () tuple2!14698)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7182 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14698)

(assert (=> b!171035 (= lt!263667 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!171036 () Bool)

(declare-fun array_inv!3763 (array!9087) Bool)

(assert (=> b!171036 (= e!119388 (array_inv!3763 (buf!4465 bs!64)))))

(assert (= (and start!37766 res!141884) b!171034))

(assert (= (and b!171034 res!141885) b!171035))

(assert (= start!37766 b!171036))

(declare-fun m!270175 () Bool)

(assert (=> start!37766 m!270175))

(declare-fun m!270177 () Bool)

(assert (=> b!171034 m!270177))

(declare-fun m!270179 () Bool)

(assert (=> b!171035 m!270179))

(declare-fun m!270181 () Bool)

(assert (=> b!171035 m!270181))

(declare-fun m!270183 () Bool)

(assert (=> b!171035 m!270183))

(declare-fun m!270185 () Bool)

(assert (=> b!171036 m!270185))

(check-sat (not b!171035) (not start!37766) (not b!171036) (not b!171034))
(check-sat)
