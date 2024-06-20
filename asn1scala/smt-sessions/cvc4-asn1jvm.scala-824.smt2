; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24402 () Bool)

(assert start!24402)

(declare-fun b!124121 () Bool)

(declare-fun e!81384 () Bool)

(declare-fun e!81383 () Bool)

(assert (=> b!124121 (= e!81384 (not e!81383))))

(declare-fun res!102890 () Bool)

(assert (=> b!124121 (=> res!102890 e!81383)))

(declare-fun lt!195794 () (_ BitVec 64))

(declare-fun lt!195795 () (_ BitVec 64))

(assert (=> b!124121 (= res!102890 (not (= lt!195794 (bvadd lt!195794 lt!195795))))))

(declare-datatypes ((array!5463 0))(
  ( (array!5464 (arr!3065 (Array (_ BitVec 32) (_ BitVec 8))) (size!2472 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4418 0))(
  ( (BitStream!4419 (buf!2918 array!5463) (currentByte!5624 (_ BitVec 32)) (currentBit!5619 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4418)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124121 (= lt!195794 (bitIndex!0 (size!2472 (buf!2918 thiss!1305)) (currentByte!5624 thiss!1305) (currentBit!5619 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4418 BitStream!4418) Bool)

(assert (=> b!124121 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7688 0))(
  ( (Unit!7689) )
))
(declare-fun lt!195793 () Unit!7688)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4418) Unit!7688)

(assert (=> b!124121 (= lt!195793 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124122 () Bool)

(declare-fun e!81386 () Bool)

(declare-fun array_inv!2274 (array!5463) Bool)

(assert (=> b!124122 (= e!81386 (array_inv!2274 (buf!2918 thiss!1305)))))

(declare-fun b!124123 () Bool)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!124123 (= e!81383 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10430 0))(
  ( (tuple2!10431 (_1!5483 BitStream!4418) (_2!5483 BitStream!4418)) )
))
(declare-fun lt!195792 () tuple2!10430)

(declare-fun reader!0 (BitStream!4418 BitStream!4418) tuple2!10430)

(assert (=> b!124123 (= lt!195792 (reader!0 thiss!1305 thiss!1305))))

(declare-fun res!102891 () Bool)

(declare-fun e!81387 () Bool)

(assert (=> start!24402 (=> (not res!102891) (not e!81387))))

(assert (=> start!24402 (= res!102891 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24402 e!81387))

(assert (=> start!24402 true))

(declare-fun inv!12 (BitStream!4418) Bool)

(assert (=> start!24402 (and (inv!12 thiss!1305) e!81386)))

(declare-fun b!124124 () Bool)

(assert (=> b!124124 (= e!81387 e!81384)))

(declare-fun res!102892 () Bool)

(assert (=> b!124124 (=> (not res!102892) (not e!81384))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124124 (= res!102892 (validate_offset_bits!1 ((_ sign_extend 32) (size!2472 (buf!2918 thiss!1305))) ((_ sign_extend 32) (currentByte!5624 thiss!1305)) ((_ sign_extend 32) (currentBit!5619 thiss!1305)) lt!195795))))

(assert (=> b!124124 (= lt!195795 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124125 () Bool)

(declare-fun res!102894 () Bool)

(assert (=> b!124125 (=> (not res!102894) (not e!81384))))

(assert (=> b!124125 (= res!102894 (bvsge i!615 nBits!396))))

(declare-fun b!124126 () Bool)

(declare-fun res!102893 () Bool)

(assert (=> b!124126 (=> (not res!102893) (not e!81384))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124126 (= res!102893 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!24402 res!102891) b!124124))

(assert (= (and b!124124 res!102892) b!124126))

(assert (= (and b!124126 res!102893) b!124125))

(assert (= (and b!124125 res!102894) b!124121))

(assert (= (and b!124121 (not res!102890)) b!124123))

(assert (= start!24402 b!124122))

(declare-fun m!189339 () Bool)

(assert (=> b!124121 m!189339))

(declare-fun m!189341 () Bool)

(assert (=> b!124121 m!189341))

(declare-fun m!189343 () Bool)

(assert (=> b!124121 m!189343))

(declare-fun m!189345 () Bool)

(assert (=> b!124124 m!189345))

(declare-fun m!189347 () Bool)

(assert (=> start!24402 m!189347))

(declare-fun m!189349 () Bool)

(assert (=> b!124123 m!189349))

(declare-fun m!189351 () Bool)

(assert (=> b!124122 m!189351))

(declare-fun m!189353 () Bool)

(assert (=> b!124126 m!189353))

(push 1)

(assert (not start!24402))

(assert (not b!124126))

(assert (