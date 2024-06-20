; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24414 () Bool)

(assert start!24414)

(declare-fun b!124229 () Bool)

(declare-fun e!81477 () Bool)

(declare-datatypes ((array!5475 0))(
  ( (array!5476 (arr!3071 (Array (_ BitVec 32) (_ BitVec 8))) (size!2478 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4430 0))(
  ( (BitStream!4431 (buf!2924 array!5475) (currentByte!5630 (_ BitVec 32)) (currentBit!5625 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4430)

(declare-fun array_inv!2280 (array!5475) Bool)

(assert (=> b!124229 (= e!81477 (array_inv!2280 (buf!2924 thiss!1305)))))

(declare-fun b!124230 () Bool)

(declare-fun res!102980 () Bool)

(declare-fun e!81475 () Bool)

(assert (=> b!124230 (=> (not res!102980) (not e!81475))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!124230 (= res!102980 (bvsge i!615 nBits!396))))

(declare-fun res!102982 () Bool)

(declare-fun e!81476 () Bool)

(assert (=> start!24414 (=> (not res!102982) (not e!81476))))

(assert (=> start!24414 (= res!102982 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24414 e!81476))

(assert (=> start!24414 true))

(declare-fun inv!12 (BitStream!4430) Bool)

(assert (=> start!24414 (and (inv!12 thiss!1305) e!81477)))

(declare-fun b!124231 () Bool)

(declare-fun e!81473 () Bool)

(assert (=> b!124231 (= e!81473 true)))

(declare-datatypes ((tuple2!10442 0))(
  ( (tuple2!10443 (_1!5489 BitStream!4430) (_2!5489 BitStream!4430)) )
))
(declare-fun lt!195865 () tuple2!10442)

(declare-fun reader!0 (BitStream!4430 BitStream!4430) tuple2!10442)

(assert (=> b!124231 (= lt!195865 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124232 () Bool)

(assert (=> b!124232 (= e!81476 e!81475)))

(declare-fun res!102981 () Bool)

(assert (=> b!124232 (=> (not res!102981) (not e!81475))))

(declare-fun lt!195867 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124232 (= res!102981 (validate_offset_bits!1 ((_ sign_extend 32) (size!2478 (buf!2924 thiss!1305))) ((_ sign_extend 32) (currentByte!5630 thiss!1305)) ((_ sign_extend 32) (currentBit!5625 thiss!1305)) lt!195867))))

(assert (=> b!124232 (= lt!195867 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124233 () Bool)

(assert (=> b!124233 (= e!81475 (not e!81473))))

(declare-fun res!102983 () Bool)

(assert (=> b!124233 (=> res!102983 e!81473)))

(declare-fun lt!195866 () (_ BitVec 64))

(assert (=> b!124233 (= res!102983 (not (= lt!195866 (bvadd lt!195866 lt!195867))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124233 (= lt!195866 (bitIndex!0 (size!2478 (buf!2924 thiss!1305)) (currentByte!5630 thiss!1305) (currentBit!5625 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4430 BitStream!4430) Bool)

(assert (=> b!124233 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7700 0))(
  ( (Unit!7701) )
))
(declare-fun lt!195864 () Unit!7700)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4430) Unit!7700)

(assert (=> b!124233 (= lt!195864 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124234 () Bool)

(declare-fun res!102984 () Bool)

(assert (=> b!124234 (=> (not res!102984) (not e!81475))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124234 (= res!102984 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!24414 res!102982) b!124232))

(assert (= (and b!124232 res!102981) b!124234))

(assert (= (and b!124234 res!102984) b!124230))

(assert (= (and b!124230 res!102980) b!124233))

(assert (= (and b!124233 (not res!102983)) b!124231))

(assert (= start!24414 b!124229))

(declare-fun m!189435 () Bool)

(assert (=> b!124233 m!189435))

(declare-fun m!189437 () Bool)

(assert (=> b!124233 m!189437))

(declare-fun m!189439 () Bool)

(assert (=> b!124233 m!189439))

(declare-fun m!189441 () Bool)

(assert (=> b!124232 m!189441))

(declare-fun m!189443 () Bool)

(assert (=> b!124234 m!189443))

(declare-fun m!189445 () Bool)

(assert (=> b!124231 m!189445))

(declare-fun m!189447 () Bool)

(assert (=> start!24414 m!189447))

(declare-fun m!189449 () Bool)

(assert (=> b!124229 m!189449))

(push 1)

(assert (not b!124232))

(assert (not b!124233))

(assert (not b!124231))

