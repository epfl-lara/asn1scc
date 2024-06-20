; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38934 () Bool)

(assert start!38934)

(declare-fun res!145155 () Bool)

(declare-fun e!122228 () Bool)

(assert (=> start!38934 (=> (not res!145155) (not e!122228))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!38934 (= res!145155 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38934 e!122228))

(assert (=> start!38934 true))

(declare-datatypes ((array!9444 0))(
  ( (array!9445 (arr!5097 (Array (_ BitVec 32) (_ BitVec 8))) (size!4167 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7442 0))(
  ( (BitStream!7443 (buf!4604 array!9444) (currentByte!8727 (_ BitVec 32)) (currentBit!8722 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7442)

(declare-fun e!122230 () Bool)

(declare-fun inv!12 (BitStream!7442) Bool)

(assert (=> start!38934 (and (inv!12 thiss!1204) e!122230)))

(declare-fun b!175291 () Bool)

(declare-fun res!145154 () Bool)

(assert (=> b!175291 (=> (not res!145154) (not e!122228))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175291 (= res!145154 (validate_offset_bits!1 ((_ sign_extend 32) (size!4167 (buf!4604 thiss!1204))) ((_ sign_extend 32) (currentByte!8727 thiss!1204)) ((_ sign_extend 32) (currentBit!8722 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!175292 () Bool)

(declare-fun array_inv!3908 (array!9444) Bool)

(assert (=> b!175292 (= e!122230 (array_inv!3908 (buf!4604 thiss!1204)))))

(declare-fun b!175293 () Bool)

(declare-fun res!145158 () Bool)

(assert (=> b!175293 (=> (not res!145158) (not e!122228))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175293 (= res!145158 (invariant!0 (currentBit!8722 thiss!1204) (currentByte!8727 thiss!1204) (size!4167 (buf!4604 thiss!1204))))))

(declare-fun b!175294 () Bool)

(declare-fun e!122227 () Bool)

(assert (=> b!175294 (= e!122228 e!122227)))

(declare-fun res!145156 () Bool)

(assert (=> b!175294 (=> (not res!145156) (not e!122227))))

(declare-fun lt!270409 () (_ BitVec 64))

(assert (=> b!175294 (= res!145156 (= lt!270409 (bvsub (bvadd lt!270409 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175294 (= lt!270409 (bitIndex!0 (size!4167 (buf!4604 thiss!1204)) (currentByte!8727 thiss!1204) (currentBit!8722 thiss!1204)))))

(declare-fun b!175295 () Bool)

(assert (=> b!175295 (= e!122227 (not (bvsle i!590 #b00000000000000000000000001000000)))))

(declare-datatypes ((tuple2!15080 0))(
  ( (tuple2!15081 (_1!8185 BitStream!7442) (_2!8185 BitStream!7442)) )
))
(declare-fun lt!270408 () tuple2!15080)

(declare-fun reader!0 (BitStream!7442 BitStream!7442) tuple2!15080)

(assert (=> b!175295 (= lt!270408 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7442 BitStream!7442) Bool)

(assert (=> b!175295 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12642 0))(
  ( (Unit!12643) )
))
(declare-fun lt!270410 () Unit!12642)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7442) Unit!12642)

(assert (=> b!175295 (= lt!270410 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175296 () Bool)

(declare-fun res!145157 () Bool)

(assert (=> b!175296 (=> (not res!145157) (not e!122228))))

(assert (=> b!175296 (= res!145157 (= i!590 nBits!348))))

(assert (= (and start!38934 res!145155) b!175291))

(assert (= (and b!175291 res!145154) b!175293))

(assert (= (and b!175293 res!145158) b!175296))

(assert (= (and b!175296 res!145157) b!175294))

(assert (= (and b!175294 res!145156) b!175295))

(assert (= start!38934 b!175292))

(declare-fun m!275487 () Bool)

(assert (=> b!175294 m!275487))

(declare-fun m!275489 () Bool)

(assert (=> b!175291 m!275489))

(declare-fun m!275491 () Bool)

(assert (=> b!175295 m!275491))

(declare-fun m!275493 () Bool)

(assert (=> b!175295 m!275493))

(declare-fun m!275495 () Bool)

(assert (=> b!175295 m!275495))

(declare-fun m!275497 () Bool)

(assert (=> start!38934 m!275497))

(declare-fun m!275499 () Bool)

(assert (=> b!175292 m!275499))

(declare-fun m!275501 () Bool)

(assert (=> b!175293 m!275501))

(push 1)

