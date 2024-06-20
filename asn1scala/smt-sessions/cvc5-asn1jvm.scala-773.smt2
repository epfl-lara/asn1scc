; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22308 () Bool)

(assert start!22308)

(declare-fun b!112772 () Bool)

(declare-fun res!93121 () Bool)

(declare-fun e!73985 () Bool)

(assert (=> b!112772 (=> (not res!93121) (not e!73985))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112772 (= res!93121 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!93122 () Bool)

(assert (=> start!22308 (=> (not res!93122) (not e!73985))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!22308 (= res!93122 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22308 e!73985))

(assert (=> start!22308 true))

(declare-datatypes ((array!5099 0))(
  ( (array!5100 (arr!2910 (Array (_ BitVec 32) (_ BitVec 8))) (size!2317 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4108 0))(
  ( (BitStream!4109 (buf!2725 array!5099) (currentByte!5299 (_ BitVec 32)) (currentBit!5294 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4108)

(declare-fun e!73986 () Bool)

(declare-fun inv!12 (BitStream!4108) Bool)

(assert (=> start!22308 (and (inv!12 thiss!1305) e!73986)))

(declare-fun b!112771 () Bool)

(declare-fun res!93120 () Bool)

(assert (=> b!112771 (=> (not res!93120) (not e!73985))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112771 (= res!93120 (validate_offset_bits!1 ((_ sign_extend 32) (size!2317 (buf!2725 thiss!1305))) ((_ sign_extend 32) (currentByte!5299 thiss!1305)) ((_ sign_extend 32) (currentBit!5294 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112774 () Bool)

(declare-fun array_inv!2119 (array!5099) Bool)

(assert (=> b!112774 (= e!73986 (array_inv!2119 (buf!2725 thiss!1305)))))

(declare-fun b!112773 () Bool)

(assert (=> b!112773 (= e!73985 (and (not (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000))) (not (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(assert (= (and start!22308 res!93122) b!112771))

(assert (= (and b!112771 res!93120) b!112772))

(assert (= (and b!112772 res!93121) b!112773))

(assert (= start!22308 b!112774))

(declare-fun m!168889 () Bool)

(assert (=> b!112772 m!168889))

(declare-fun m!168891 () Bool)

(assert (=> start!22308 m!168891))

(declare-fun m!168893 () Bool)

(assert (=> b!112771 m!168893))

(declare-fun m!168895 () Bool)

(assert (=> b!112774 m!168895))

(push 1)

(assert (not start!22308))

(assert (not b!112771))

(assert (not b!112772))

(assert (not b!112774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

