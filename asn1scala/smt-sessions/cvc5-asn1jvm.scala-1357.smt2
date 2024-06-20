; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37632 () Bool)

(assert start!37632)

(declare-fun res!141689 () Bool)

(declare-fun e!119134 () Bool)

(assert (=> start!37632 (=> (not res!141689) (not e!119134))))

(declare-datatypes ((array!9043 0))(
  ( (array!9044 (arr!4933 (Array (_ BitVec 32) (_ BitVec 8))) (size!4003 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7144 0))(
  ( (BitStream!7145 (buf!4446 array!9043) (currentByte!8433 (_ BitVec 32)) (currentBit!8428 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7144)

(declare-fun from!235 () (_ BitVec 64))

(declare-fun nBits!283 () (_ BitVec 64))

(assert (=> start!37632 (= res!141689 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (bvsle ((_ sign_extend 32) (size!4003 (buf!4446 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8433 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8428 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4003 (buf!4446 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8433 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8428 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!37632 e!119134))

(assert (=> start!37632 true))

(declare-fun e!119133 () Bool)

(declare-fun inv!12 (BitStream!7144) Bool)

(assert (=> start!37632 (and (inv!12 bs!64) e!119133)))

(declare-fun b!170743 () Bool)

(declare-fun res!141690 () Bool)

(assert (=> b!170743 (=> (not res!141690) (not e!119134))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!170743 (= res!141690 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8428 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8433 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (size!4003 (buf!4446 bs!64))))))))

(declare-fun b!170744 () Bool)

(assert (=> b!170744 (= e!119134 (bvslt (bvsub nBits!283 from!235) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!170745 () Bool)

(declare-fun array_inv!3744 (array!9043) Bool)

(assert (=> b!170745 (= e!119133 (array_inv!3744 (buf!4446 bs!64)))))

(assert (= (and start!37632 res!141689) b!170743))

(assert (= (and b!170743 res!141690) b!170744))

(assert (= start!37632 b!170745))

(declare-fun m!269905 () Bool)

(assert (=> start!37632 m!269905))

(declare-fun m!269907 () Bool)

(assert (=> b!170743 m!269907))

(declare-fun m!269909 () Bool)

(assert (=> b!170745 m!269909))

(push 1)

(assert (not b!170745))

(assert (not b!170743))

(assert (not start!37632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

