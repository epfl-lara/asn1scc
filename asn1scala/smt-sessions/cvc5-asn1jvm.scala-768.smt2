; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21940 () Bool)

(assert start!21940)

(declare-fun b!110632 () Bool)

(declare-fun e!72563 () Bool)

(declare-datatypes ((array!5069 0))(
  ( (array!5070 (arr!2898 (Array (_ BitVec 32) (_ BitVec 8))) (size!2305 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4084 0))(
  ( (BitStream!4085 (buf!2702 array!5069) (currentByte!5259 (_ BitVec 32)) (currentBit!5254 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4084)

(declare-fun array_inv!2107 (array!5069) Bool)

(assert (=> b!110632 (= e!72563 (array_inv!2107 (buf!2702 thiss!1305)))))

(declare-fun b!110633 () Bool)

(declare-fun res!91325 () Bool)

(declare-fun e!72566 () Bool)

(assert (=> b!110633 (=> (not res!91325) (not e!72566))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110633 (= res!91325 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!91327 () Bool)

(declare-fun e!72561 () Bool)

(assert (=> start!21940 (=> (not res!91327) (not e!72561))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!21940 (= res!91327 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21940 e!72561))

(assert (=> start!21940 true))

(declare-fun inv!12 (BitStream!4084) Bool)

(assert (=> start!21940 (and (inv!12 thiss!1305) e!72563)))

(declare-fun b!110634 () Bool)

(assert (=> b!110634 (= e!72561 e!72566)))

(declare-fun res!91326 () Bool)

(assert (=> b!110634 (=> (not res!91326) (not e!72566))))

(declare-fun lt!167472 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110634 (= res!91326 (validate_offset_bits!1 ((_ sign_extend 32) (size!2305 (buf!2702 thiss!1305))) ((_ sign_extend 32) (currentByte!5259 thiss!1305)) ((_ sign_extend 32) (currentBit!5254 thiss!1305)) lt!167472))))

(assert (=> b!110634 (= lt!167472 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110635 () Bool)

(declare-fun e!72564 () Bool)

(declare-fun lt!167470 () (_ BitVec 64))

(assert (=> b!110635 (= e!72564 (= (bvand (bvand v!199 (bvnot lt!167470)) lt!167470) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!110636 () Bool)

(declare-fun e!72562 () Bool)

(assert (=> b!110636 (= e!72566 (not e!72562))))

(declare-fun res!91328 () Bool)

(assert (=> b!110636 (=> res!91328 e!72562)))

(declare-fun lt!167473 () (_ BitVec 64))

(assert (=> b!110636 (= res!91328 (not (= lt!167473 (bvadd lt!167473 lt!167472))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110636 (= lt!167473 (bitIndex!0 (size!2305 (buf!2702 thiss!1305)) (currentByte!5259 thiss!1305) (currentBit!5254 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4084 BitStream!4084) Bool)

(assert (=> b!110636 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6778 0))(
  ( (Unit!6779) )
))
(declare-fun lt!167469 () Unit!6778)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4084) Unit!6778)

(assert (=> b!110636 (= lt!167469 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110637 () Bool)

(assert (=> b!110637 (= e!72562 e!72564)))

(declare-fun res!91330 () Bool)

(assert (=> b!110637 (=> res!91330 e!72564)))

(declare-datatypes ((tuple2!9204 0))(
  ( (tuple2!9205 (_1!4859 BitStream!4084) (_2!4859 BitStream!4084)) )
))
(declare-fun lt!167474 () tuple2!9204)

(assert (=> b!110637 (= res!91330 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2305 (buf!2702 (_1!4859 lt!167474)))) ((_ sign_extend 32) (currentByte!5259 (_1!4859 lt!167474))) ((_ sign_extend 32) (currentBit!5254 (_1!4859 lt!167474))) lt!167472)))))

(declare-fun lt!167471 () Unit!6778)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4084 array!5069 (_ BitVec 64)) Unit!6778)

(assert (=> b!110637 (= lt!167471 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2702 thiss!1305) lt!167472))))

(assert (=> b!110637 (= lt!167470 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun reader!0 (BitStream!4084 BitStream!4084) tuple2!9204)

(assert (=> b!110637 (= lt!167474 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110638 () Bool)

(declare-fun res!91329 () Bool)

(assert (=> b!110638 (=> (not res!91329) (not e!72566))))

(assert (=> b!110638 (= res!91329 (bvsge i!615 nBits!396))))

(assert (= (and start!21940 res!91327) b!110634))

(assert (= (and b!110634 res!91326) b!110633))

(assert (= (and b!110633 res!91325) b!110638))

(assert (= (and b!110638 res!91329) b!110636))

(assert (= (and b!110636 (not res!91328)) b!110637))

(assert (= (and b!110637 (not res!91330)) b!110635))

(assert (= start!21940 b!110632))

(declare-fun m!164207 () Bool)

(assert (=> start!21940 m!164207))

(declare-fun m!164209 () Bool)

(assert (=> b!110637 m!164209))

(declare-fun m!164211 () Bool)

(assert (=> b!110637 m!164211))

(declare-fun m!164213 () Bool)

(assert (=> b!110637 m!164213))

(declare-fun m!164215 () Bool)

(assert (=> b!110637 m!164215))

(declare-fun m!164217 () Bool)

(assert (=> b!110636 m!164217))

(declare-fun m!164219 () Bool)

(assert (=> b!110636 m!164219))

(declare-fun m!164221 () Bool)

(assert (=> b!110636 m!164221))

(declare-fun m!164223 () Bool)

(assert (=> b!110632 m!164223))

(declare-fun m!164225 () Bool)

(assert (=> b!110633 m!164225))

(declare-fun m!164227 () Bool)

(assert (=> b!110634 m!164227))

(push 1)

(assert (not b!110633))

(assert (not b!110637))

(assert (not b!110634))

(assert (not b!110636))

(assert (not start!21940))

(assert (not b!110632))

(check-sat)

(pop 1)

