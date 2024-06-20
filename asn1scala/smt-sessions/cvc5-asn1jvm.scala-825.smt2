; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24404 () Bool)

(assert start!24404)

(declare-fun b!124139 () Bool)

(declare-fun e!81399 () Bool)

(assert (=> b!124139 (= e!81399 true)))

(declare-datatypes ((array!5465 0))(
  ( (array!5466 (arr!3066 (Array (_ BitVec 32) (_ BitVec 8))) (size!2473 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4420 0))(
  ( (BitStream!4421 (buf!2919 array!5465) (currentByte!5625 (_ BitVec 32)) (currentBit!5620 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10432 0))(
  ( (tuple2!10433 (_1!5484 BitStream!4420) (_2!5484 BitStream!4420)) )
))
(declare-fun lt!195806 () tuple2!10432)

(declare-fun thiss!1305 () BitStream!4420)

(declare-fun reader!0 (BitStream!4420 BitStream!4420) tuple2!10432)

(assert (=> b!124139 (= lt!195806 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124140 () Bool)

(declare-fun e!81400 () Bool)

(declare-fun e!81401 () Bool)

(assert (=> b!124140 (= e!81400 e!81401)))

(declare-fun res!102905 () Bool)

(assert (=> b!124140 (=> (not res!102905) (not e!81401))))

(declare-fun lt!195805 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124140 (= res!102905 (validate_offset_bits!1 ((_ sign_extend 32) (size!2473 (buf!2919 thiss!1305))) ((_ sign_extend 32) (currentByte!5625 thiss!1305)) ((_ sign_extend 32) (currentBit!5620 thiss!1305)) lt!195805))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!124140 (= lt!195805 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124141 () Bool)

(declare-fun res!102908 () Bool)

(assert (=> b!124141 (=> (not res!102908) (not e!81401))))

(assert (=> b!124141 (= res!102908 (bvsge i!615 nBits!396))))

(declare-fun b!124142 () Bool)

(assert (=> b!124142 (= e!81401 (not e!81399))))

(declare-fun res!102906 () Bool)

(assert (=> b!124142 (=> res!102906 e!81399)))

(declare-fun lt!195804 () (_ BitVec 64))

(assert (=> b!124142 (= res!102906 (not (= lt!195804 (bvadd lt!195804 lt!195805))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124142 (= lt!195804 (bitIndex!0 (size!2473 (buf!2919 thiss!1305)) (currentByte!5625 thiss!1305) (currentBit!5620 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4420 BitStream!4420) Bool)

(assert (=> b!124142 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7690 0))(
  ( (Unit!7691) )
))
(declare-fun lt!195807 () Unit!7690)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4420) Unit!7690)

(assert (=> b!124142 (= lt!195807 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun res!102907 () Bool)

(assert (=> start!24404 (=> (not res!102907) (not e!81400))))

(assert (=> start!24404 (= res!102907 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24404 e!81400))

(assert (=> start!24404 true))

(declare-fun e!81402 () Bool)

(declare-fun inv!12 (BitStream!4420) Bool)

(assert (=> start!24404 (and (inv!12 thiss!1305) e!81402)))

(declare-fun b!124143 () Bool)

(declare-fun array_inv!2275 (array!5465) Bool)

(assert (=> b!124143 (= e!81402 (array_inv!2275 (buf!2919 thiss!1305)))))

(declare-fun b!124144 () Bool)

(declare-fun res!102909 () Bool)

(assert (=> b!124144 (=> (not res!102909) (not e!81401))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124144 (= res!102909 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!24404 res!102907) b!124140))

(assert (= (and b!124140 res!102905) b!124144))

(assert (= (and b!124144 res!102909) b!124141))

(assert (= (and b!124141 res!102908) b!124142))

(assert (= (and b!124142 (not res!102906)) b!124139))

(assert (= start!24404 b!124143))

(declare-fun m!189355 () Bool)

(assert (=> b!124143 m!189355))

(declare-fun m!189357 () Bool)

(assert (=> b!124142 m!189357))

(declare-fun m!189359 () Bool)

(assert (=> b!124142 m!189359))

(declare-fun m!189361 () Bool)

(assert (=> b!124142 m!189361))

(declare-fun m!189363 () Bool)

(assert (=> b!124140 m!189363))

(declare-fun m!189365 () Bool)

(assert (=> start!24404 m!189365))

(declare-fun m!189367 () Bool)

(assert (=> b!124139 m!189367))

(declare-fun m!189369 () Bool)

(assert (=> b!124144 m!189369))

(push 1)

(assert (not b!124142))

(assert (not b!124144))

(assert (not b!124139))

(assert (not b!124143))

(assert (not start!24404))

(assert (not b!124140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

