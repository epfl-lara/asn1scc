; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38932 () Bool)

(assert start!38932)

(declare-fun b!175273 () Bool)

(declare-fun res!145139 () Bool)

(declare-fun e!122217 () Bool)

(assert (=> b!175273 (=> (not res!145139) (not e!122217))))

(declare-datatypes ((array!9442 0))(
  ( (array!9443 (arr!5096 (Array (_ BitVec 32) (_ BitVec 8))) (size!4166 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7440 0))(
  ( (BitStream!7441 (buf!4603 array!9442) (currentByte!8726 (_ BitVec 32)) (currentBit!8721 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7440)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175273 (= res!145139 (invariant!0 (currentBit!8721 thiss!1204) (currentByte!8726 thiss!1204) (size!4166 (buf!4603 thiss!1204))))))

(declare-fun b!175275 () Bool)

(declare-fun res!145141 () Bool)

(assert (=> b!175275 (=> (not res!145141) (not e!122217))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175275 (= res!145141 (validate_offset_bits!1 ((_ sign_extend 32) (size!4166 (buf!4603 thiss!1204))) ((_ sign_extend 32) (currentByte!8726 thiss!1204)) ((_ sign_extend 32) (currentBit!8721 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175276 () Bool)

(declare-fun e!122215 () Bool)

(assert (=> b!175276 (= e!122215 (not (bvsle i!590 #b00000000000000000000000001000000)))))

(declare-datatypes ((tuple2!15078 0))(
  ( (tuple2!15079 (_1!8184 BitStream!7440) (_2!8184 BitStream!7440)) )
))
(declare-fun lt!270401 () tuple2!15078)

(declare-fun reader!0 (BitStream!7440 BitStream!7440) tuple2!15078)

(assert (=> b!175276 (= lt!270401 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7440 BitStream!7440) Bool)

(assert (=> b!175276 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12640 0))(
  ( (Unit!12641) )
))
(declare-fun lt!270400 () Unit!12640)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7440) Unit!12640)

(assert (=> b!175276 (= lt!270400 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175277 () Bool)

(assert (=> b!175277 (= e!122217 e!122215)))

(declare-fun res!145142 () Bool)

(assert (=> b!175277 (=> (not res!145142) (not e!122215))))

(declare-fun lt!270399 () (_ BitVec 64))

(assert (=> b!175277 (= res!145142 (= lt!270399 (bvsub (bvadd lt!270399 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175277 (= lt!270399 (bitIndex!0 (size!4166 (buf!4603 thiss!1204)) (currentByte!8726 thiss!1204) (currentBit!8721 thiss!1204)))))

(declare-fun b!175278 () Bool)

(declare-fun e!122218 () Bool)

(declare-fun array_inv!3907 (array!9442) Bool)

(assert (=> b!175278 (= e!122218 (array_inv!3907 (buf!4603 thiss!1204)))))

(declare-fun res!145140 () Bool)

(assert (=> start!38932 (=> (not res!145140) (not e!122217))))

(assert (=> start!38932 (= res!145140 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38932 e!122217))

(assert (=> start!38932 true))

(declare-fun inv!12 (BitStream!7440) Bool)

(assert (=> start!38932 (and (inv!12 thiss!1204) e!122218)))

(declare-fun b!175274 () Bool)

(declare-fun res!145143 () Bool)

(assert (=> b!175274 (=> (not res!145143) (not e!122217))))

(assert (=> b!175274 (= res!145143 (= i!590 nBits!348))))

(assert (= (and start!38932 res!145140) b!175275))

(assert (= (and b!175275 res!145141) b!175273))

(assert (= (and b!175273 res!145139) b!175274))

(assert (= (and b!175274 res!145143) b!175277))

(assert (= (and b!175277 res!145142) b!175276))

(assert (= start!38932 b!175278))

(declare-fun m!275471 () Bool)

(assert (=> start!38932 m!275471))

(declare-fun m!275473 () Bool)

(assert (=> b!175273 m!275473))

(declare-fun m!275475 () Bool)

(assert (=> b!175278 m!275475))

(declare-fun m!275477 () Bool)

(assert (=> b!175276 m!275477))

(declare-fun m!275479 () Bool)

(assert (=> b!175276 m!275479))

(declare-fun m!275481 () Bool)

(assert (=> b!175276 m!275481))

(declare-fun m!275483 () Bool)

(assert (=> b!175277 m!275483))

(declare-fun m!275485 () Bool)

(assert (=> b!175275 m!275485))

(check-sat (not b!175278) (not start!38932) (not b!175273) (not b!175276) (not b!175275) (not b!175277))
