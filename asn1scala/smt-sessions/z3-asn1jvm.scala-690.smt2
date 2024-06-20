; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19404 () Bool)

(assert start!19404)

(declare-fun b!96903 () Bool)

(declare-fun e!63522 () Bool)

(declare-datatypes ((array!4530 0))(
  ( (array!4531 (arr!2665 (Array (_ BitVec 32) (_ BitVec 8))) (size!2072 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3618 0))(
  ( (BitStream!3619 (buf!2418 array!4530) (currentByte!4825 (_ BitVec 32)) (currentBit!4820 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3618)

(declare-fun array_inv!1874 (array!4530) Bool)

(assert (=> b!96903 (= e!63522 (array_inv!1874 (buf!2418 thiss!1288)))))

(declare-fun b!96902 () Bool)

(declare-fun e!63521 () Bool)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96902 (= e!63521 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2072 (buf!2418 thiss!1288))) ((_ sign_extend 32) (currentByte!4825 thiss!1288)) ((_ sign_extend 32) (currentBit!4820 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!96900 () Bool)

(declare-fun res!79527 () Bool)

(assert (=> b!96900 (=> (not res!79527) (not e!63521))))

(assert (=> b!96900 (= res!79527 (validate_offset_bits!1 ((_ sign_extend 32) (size!2072 (buf!2418 thiss!1288))) ((_ sign_extend 32) (currentByte!4825 thiss!1288)) ((_ sign_extend 32) (currentBit!4820 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun res!79528 () Bool)

(assert (=> start!19404 (=> (not res!79528) (not e!63521))))

(assert (=> start!19404 (= res!79528 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19404 e!63521))

(assert (=> start!19404 true))

(declare-fun inv!12 (BitStream!3618) Bool)

(assert (=> start!19404 (and (inv!12 thiss!1288) e!63522)))

(declare-fun b!96901 () Bool)

(declare-fun res!79526 () Bool)

(assert (=> b!96901 (=> (not res!79526) (not e!63521))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96901 (= res!79526 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(assert (= (and start!19404 res!79528) b!96900))

(assert (= (and b!96900 res!79527) b!96901))

(assert (= (and b!96901 res!79526) b!96902))

(assert (= start!19404 b!96903))

(declare-fun m!140537 () Bool)

(assert (=> b!96903 m!140537))

(declare-fun m!140539 () Bool)

(assert (=> b!96900 m!140539))

(assert (=> b!96902 m!140539))

(declare-fun m!140541 () Bool)

(assert (=> start!19404 m!140541))

(declare-fun m!140543 () Bool)

(assert (=> b!96901 m!140543))

(check-sat (not b!96902) (not b!96900) (not start!19404) (not b!96903) (not b!96901))
