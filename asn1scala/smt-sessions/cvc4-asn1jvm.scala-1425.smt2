; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39102 () Bool)

(assert start!39102)

(declare-fun b!175930 () Bool)

(declare-fun res!145687 () Bool)

(declare-fun e!122668 () Bool)

(assert (=> b!175930 (=> (not res!145687) (not e!122668))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175930 (= res!145687 (= i!590 nBits!348))))

(declare-fun b!175931 () Bool)

(declare-fun e!122670 () Bool)

(assert (=> b!175931 (= e!122670 (not true))))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((array!9498 0))(
  ( (array!9499 (arr!5121 (Array (_ BitVec 32) (_ BitVec 8))) (size!4191 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7490 0))(
  ( (BitStream!7491 (buf!4634 array!9498) (currentByte!8769 (_ BitVec 32)) (currentBit!8764 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15132 0))(
  ( (tuple2!15133 (_1!8211 BitStream!7490) (_2!8211 (_ BitVec 64))) )
))
(declare-fun lt!271233 () tuple2!15132)

(declare-datatypes ((tuple2!15134 0))(
  ( (tuple2!15135 (_1!8212 BitStream!7490) (_2!8212 BitStream!7490)) )
))
(declare-fun lt!271236 () tuple2!15134)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15132)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175931 (= lt!271233 (readNBitsLSBFirstsLoopPure!0 (_1!8212 lt!271236) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-datatypes ((Unit!12696 0))(
  ( (Unit!12697) )
))
(declare-fun lt!271237 () Unit!12696)

(declare-fun thiss!1204 () BitStream!7490)

(declare-fun lt!271235 () (_ BitVec 64))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7490 array!9498 (_ BitVec 64)) Unit!12696)

(assert (=> b!175931 (= lt!271237 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4634 thiss!1204) lt!271235))))

(declare-fun reader!0 (BitStream!7490 BitStream!7490) tuple2!15134)

(assert (=> b!175931 (= lt!271236 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7490 BitStream!7490) Bool)

(assert (=> b!175931 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!271238 () Unit!12696)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7490) Unit!12696)

(assert (=> b!175931 (= lt!271238 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175932 () Bool)

(assert (=> b!175932 (= e!122668 e!122670)))

(declare-fun res!145689 () Bool)

(assert (=> b!175932 (=> (not res!145689) (not e!122670))))

(declare-fun lt!271234 () (_ BitVec 64))

(assert (=> b!175932 (= res!145689 (= lt!271234 (bvsub (bvadd lt!271234 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175932 (= lt!271234 (bitIndex!0 (size!4191 (buf!4634 thiss!1204)) (currentByte!8769 thiss!1204) (currentBit!8764 thiss!1204)))))

(declare-fun res!145688 () Bool)

(declare-fun e!122667 () Bool)

(assert (=> start!39102 (=> (not res!145688) (not e!122667))))

(assert (=> start!39102 (= res!145688 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39102 e!122667))

(assert (=> start!39102 true))

(declare-fun e!122671 () Bool)

(declare-fun inv!12 (BitStream!7490) Bool)

(assert (=> start!39102 (and (inv!12 thiss!1204) e!122671)))

(declare-fun b!175933 () Bool)

(declare-fun array_inv!3932 (array!9498) Bool)

(assert (=> b!175933 (= e!122671 (array_inv!3932 (buf!4634 thiss!1204)))))

(declare-fun b!175934 () Bool)

(assert (=> b!175934 (= e!122667 e!122668)))

(declare-fun res!145685 () Bool)

(assert (=> b!175934 (=> (not res!145685) (not e!122668))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175934 (= res!145685 (validate_offset_bits!1 ((_ sign_extend 32) (size!4191 (buf!4634 thiss!1204))) ((_ sign_extend 32) (currentByte!8769 thiss!1204)) ((_ sign_extend 32) (currentBit!8764 thiss!1204)) lt!271235))))

(assert (=> b!175934 (= lt!271235 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!175935 () Bool)

(declare-fun res!145686 () Bool)

(assert (=> b!175935 (=> (not res!145686) (not e!122668))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175935 (= res!145686 (invariant!0 (currentBit!8764 thiss!1204) (currentByte!8769 thiss!1204) (size!4191 (buf!4634 thiss!1204))))))

(assert (= (and start!39102 res!145688) b!175934))

(assert (= (and b!175934 res!145685) b!175935))

(assert (= (and b!175935 res!145686) b!175930))

(assert (= (and b!175930 res!145687) b!175932))

(assert (= (and b!175932 res!145689) b!175931))

(assert (= start!39102 b!175933))

(declare-fun m!276129 () Bool)

(assert (=> b!175933 m!276129))

(declare-fun m!276131 () Bool)

(assert (=> b!175934 m!276131))

(declare-fun m!276133 () Bool)

(assert (=> b!175935 m!276133))

(declare-fun m!276135 () Bool)

(assert (=> b!175932 m!276135))

(declare-fun m!276137 () Bool)

(assert (=> b!175931 m!276137))

(declare-fun m!276139 () Bool)

(assert (=> b!175931 m!276139))

(declare-fun m!276141 () Bool)

(assert (=> b!175931 m!276141))

(declare-fun m!276143 () Bool)

(assert (=> b!175931 m!276143))

(declare-fun m!276145 () Bool)

(assert (=> b!175931 m!276145))

(declare-fun m!276147 () Bool)

(assert (=> b!175931 m!276147))

(declare-fun m!276149 () Bool)

(assert (=> start!39102 m!276149))

(push 1)

(assert (not b!175931))

(assert (not b!175934))

(assert (not start!39102))

(assert (not b!175932))

(assert (not b!175933))

(assert (not b!175935))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

