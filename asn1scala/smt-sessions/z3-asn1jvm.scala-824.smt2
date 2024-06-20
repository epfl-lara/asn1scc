; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24400 () Bool)

(assert start!24400)

(declare-fun b!124103 () Bool)

(declare-fun e!81372 () Bool)

(declare-fun e!81369 () Bool)

(assert (=> b!124103 (= e!81372 e!81369)))

(declare-fun res!102877 () Bool)

(assert (=> b!124103 (=> (not res!102877) (not e!81369))))

(declare-datatypes ((array!5461 0))(
  ( (array!5462 (arr!3064 (Array (_ BitVec 32) (_ BitVec 8))) (size!2471 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4416 0))(
  ( (BitStream!4417 (buf!2917 array!5461) (currentByte!5623 (_ BitVec 32)) (currentBit!5618 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4416)

(declare-fun lt!195783 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124103 (= res!102877 (validate_offset_bits!1 ((_ sign_extend 32) (size!2471 (buf!2917 thiss!1305))) ((_ sign_extend 32) (currentByte!5623 thiss!1305)) ((_ sign_extend 32) (currentBit!5618 thiss!1305)) lt!195783))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!124103 (= lt!195783 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124104 () Bool)

(declare-fun e!81368 () Bool)

(declare-fun array_inv!2273 (array!5461) Bool)

(assert (=> b!124104 (= e!81368 (array_inv!2273 (buf!2917 thiss!1305)))))

(declare-fun b!124105 () Bool)

(declare-fun e!81370 () Bool)

(assert (=> b!124105 (= e!81370 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10428 0))(
  ( (tuple2!10429 (_1!5482 BitStream!4416) (_2!5482 BitStream!4416)) )
))
(declare-fun lt!195780 () tuple2!10428)

(declare-fun reader!0 (BitStream!4416 BitStream!4416) tuple2!10428)

(assert (=> b!124105 (= lt!195780 (reader!0 thiss!1305 thiss!1305))))

(declare-fun res!102878 () Bool)

(assert (=> start!24400 (=> (not res!102878) (not e!81372))))

(assert (=> start!24400 (= res!102878 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24400 e!81372))

(assert (=> start!24400 true))

(declare-fun inv!12 (BitStream!4416) Bool)

(assert (=> start!24400 (and (inv!12 thiss!1305) e!81368)))

(declare-fun b!124106 () Bool)

(declare-fun res!102879 () Bool)

(assert (=> b!124106 (=> (not res!102879) (not e!81369))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124106 (= res!102879 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124107 () Bool)

(assert (=> b!124107 (= e!81369 (not e!81370))))

(declare-fun res!102875 () Bool)

(assert (=> b!124107 (=> res!102875 e!81370)))

(declare-fun lt!195781 () (_ BitVec 64))

(assert (=> b!124107 (= res!102875 (not (= lt!195781 (bvadd lt!195781 lt!195783))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124107 (= lt!195781 (bitIndex!0 (size!2471 (buf!2917 thiss!1305)) (currentByte!5623 thiss!1305) (currentBit!5618 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4416 BitStream!4416) Bool)

(assert (=> b!124107 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7686 0))(
  ( (Unit!7687) )
))
(declare-fun lt!195782 () Unit!7686)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4416) Unit!7686)

(assert (=> b!124107 (= lt!195782 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124108 () Bool)

(declare-fun res!102876 () Bool)

(assert (=> b!124108 (=> (not res!102876) (not e!81369))))

(assert (=> b!124108 (= res!102876 (bvsge i!615 nBits!396))))

(assert (= (and start!24400 res!102878) b!124103))

(assert (= (and b!124103 res!102877) b!124106))

(assert (= (and b!124106 res!102879) b!124108))

(assert (= (and b!124108 res!102876) b!124107))

(assert (= (and b!124107 (not res!102875)) b!124105))

(assert (= start!24400 b!124104))

(declare-fun m!189323 () Bool)

(assert (=> b!124105 m!189323))

(declare-fun m!189325 () Bool)

(assert (=> b!124107 m!189325))

(declare-fun m!189327 () Bool)

(assert (=> b!124107 m!189327))

(declare-fun m!189329 () Bool)

(assert (=> b!124107 m!189329))

(declare-fun m!189331 () Bool)

(assert (=> b!124103 m!189331))

(declare-fun m!189333 () Bool)

(assert (=> start!24400 m!189333))

(declare-fun m!189335 () Bool)

(assert (=> b!124104 m!189335))

(declare-fun m!189337 () Bool)

(assert (=> b!124106 m!189337))

(check-sat (not b!124105) (not b!124104) (not b!124103) (not b!124107) (not start!24400) (not b!124106))
(check-sat)
