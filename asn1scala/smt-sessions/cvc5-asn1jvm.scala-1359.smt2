; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37644 () Bool)

(assert start!37644)

(declare-fun res!141726 () Bool)

(declare-fun e!119186 () Bool)

(assert (=> start!37644 (=> (not res!141726) (not e!119186))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37644 (= res!141726 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37644 e!119186))

(assert (=> start!37644 true))

(declare-datatypes ((array!9055 0))(
  ( (array!9056 (arr!4939 (Array (_ BitVec 32) (_ BitVec 8))) (size!4009 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7156 0))(
  ( (BitStream!7157 (buf!4452 array!9055) (currentByte!8439 (_ BitVec 32)) (currentBit!8434 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7156)

(declare-fun e!119187 () Bool)

(declare-fun inv!12 (BitStream!7156) Bool)

(assert (=> start!37644 (and (inv!12 bs!64) e!119187)))

(declare-fun b!170797 () Bool)

(declare-fun res!141725 () Bool)

(assert (=> b!170797 (=> (not res!141725) (not e!119186))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170797 (= res!141725 (validate_offset_bits!1 ((_ sign_extend 32) (size!4009 (buf!4452 bs!64))) ((_ sign_extend 32) (currentByte!8439 bs!64)) ((_ sign_extend 32) (currentBit!8434 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170798 () Bool)

(assert (=> b!170798 (= e!119186 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsgt from!235 nBits!283)))))

(declare-fun b!170799 () Bool)

(declare-fun array_inv!3750 (array!9055) Bool)

(assert (=> b!170799 (= e!119187 (array_inv!3750 (buf!4452 bs!64)))))

(assert (= (and start!37644 res!141726) b!170797))

(assert (= (and b!170797 res!141725) b!170798))

(assert (= start!37644 b!170799))

(declare-fun m!269941 () Bool)

(assert (=> start!37644 m!269941))

(declare-fun m!269943 () Bool)

(assert (=> b!170797 m!269943))

(declare-fun m!269945 () Bool)

(assert (=> b!170799 m!269945))

(push 1)

(assert (not b!170799))

(assert (not start!37644))

(assert (not b!170797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

