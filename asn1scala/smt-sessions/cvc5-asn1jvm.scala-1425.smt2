; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39098 () Bool)

(assert start!39098)

(declare-fun b!175894 () Bool)

(declare-fun e!122638 () Bool)

(declare-fun e!122637 () Bool)

(assert (=> b!175894 (= e!122638 e!122637)))

(declare-fun res!145656 () Bool)

(assert (=> b!175894 (=> (not res!145656) (not e!122637))))

(declare-datatypes ((array!9494 0))(
  ( (array!9495 (arr!5119 (Array (_ BitVec 32) (_ BitVec 8))) (size!4189 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7486 0))(
  ( (BitStream!7487 (buf!4632 array!9494) (currentByte!8767 (_ BitVec 32)) (currentBit!8762 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7486)

(declare-fun lt!271198 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175894 (= res!145656 (validate_offset_bits!1 ((_ sign_extend 32) (size!4189 (buf!4632 thiss!1204))) ((_ sign_extend 32) (currentByte!8767 thiss!1204)) ((_ sign_extend 32) (currentBit!8762 thiss!1204)) lt!271198))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!175894 (= lt!271198 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun res!145657 () Bool)

(assert (=> start!39098 (=> (not res!145657) (not e!122638))))

(assert (=> start!39098 (= res!145657 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39098 e!122638))

(assert (=> start!39098 true))

(declare-fun e!122639 () Bool)

(declare-fun inv!12 (BitStream!7486) Bool)

(assert (=> start!39098 (and (inv!12 thiss!1204) e!122639)))

(declare-fun b!175895 () Bool)

(declare-fun res!145659 () Bool)

(assert (=> b!175895 (=> (not res!145659) (not e!122637))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175895 (= res!145659 (invariant!0 (currentBit!8762 thiss!1204) (currentByte!8767 thiss!1204) (size!4189 (buf!4632 thiss!1204))))))

(declare-fun b!175896 () Bool)

(declare-fun e!122641 () Bool)

(assert (=> b!175896 (= e!122641 (not true))))

(declare-datatypes ((tuple2!15124 0))(
  ( (tuple2!15125 (_1!8207 BitStream!7486) (_2!8207 (_ BitVec 64))) )
))
(declare-fun lt!271202 () tuple2!15124)

(declare-datatypes ((tuple2!15126 0))(
  ( (tuple2!15127 (_1!8208 BitStream!7486) (_2!8208 BitStream!7486)) )
))
(declare-fun lt!271200 () tuple2!15126)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15124)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175896 (= lt!271202 (readNBitsLSBFirstsLoopPure!0 (_1!8208 lt!271200) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-datatypes ((Unit!12692 0))(
  ( (Unit!12693) )
))
(declare-fun lt!271199 () Unit!12692)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7486 array!9494 (_ BitVec 64)) Unit!12692)

(assert (=> b!175896 (= lt!271199 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4632 thiss!1204) lt!271198))))

(declare-fun reader!0 (BitStream!7486 BitStream!7486) tuple2!15126)

(assert (=> b!175896 (= lt!271200 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7486 BitStream!7486) Bool)

(assert (=> b!175896 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!271197 () Unit!12692)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7486) Unit!12692)

(assert (=> b!175896 (= lt!271197 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175897 () Bool)

(assert (=> b!175897 (= e!122637 e!122641)))

(declare-fun res!145655 () Bool)

(assert (=> b!175897 (=> (not res!145655) (not e!122641))))

(declare-fun lt!271201 () (_ BitVec 64))

(assert (=> b!175897 (= res!145655 (= lt!271201 (bvsub (bvadd lt!271201 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175897 (= lt!271201 (bitIndex!0 (size!4189 (buf!4632 thiss!1204)) (currentByte!8767 thiss!1204) (currentBit!8762 thiss!1204)))))

(declare-fun b!175898 () Bool)

(declare-fun array_inv!3930 (array!9494) Bool)

(assert (=> b!175898 (= e!122639 (array_inv!3930 (buf!4632 thiss!1204)))))

(declare-fun b!175899 () Bool)

(declare-fun res!145658 () Bool)

(assert (=> b!175899 (=> (not res!145658) (not e!122637))))

(assert (=> b!175899 (= res!145658 (= i!590 nBits!348))))

(assert (= (and start!39098 res!145657) b!175894))

(assert (= (and b!175894 res!145656) b!175895))

(assert (= (and b!175895 res!145659) b!175899))

(assert (= (and b!175899 res!145658) b!175897))

(assert (= (and b!175897 res!145655) b!175896))

(assert (= start!39098 b!175898))

(declare-fun m!276085 () Bool)

(assert (=> b!175898 m!276085))

(declare-fun m!276087 () Bool)

(assert (=> b!175897 m!276087))

(declare-fun m!276089 () Bool)

(assert (=> start!39098 m!276089))

(declare-fun m!276091 () Bool)

(assert (=> b!175896 m!276091))

(declare-fun m!276093 () Bool)

(assert (=> b!175896 m!276093))

(declare-fun m!276095 () Bool)

(assert (=> b!175896 m!276095))

(declare-fun m!276097 () Bool)

(assert (=> b!175896 m!276097))

(declare-fun m!276099 () Bool)

(assert (=> b!175896 m!276099))

(declare-fun m!276101 () Bool)

(assert (=> b!175896 m!276101))

(declare-fun m!276103 () Bool)

(assert (=> b!175895 m!276103))

(declare-fun m!276105 () Bool)

(assert (=> b!175894 m!276105))

(push 1)

(assert (not b!175894))

(assert (not start!39098))

(assert (not b!175896))

(assert (not b!175897))

(assert (not b!175898))

(assert (not b!175895))

(check-sat)

(pop 1)

