; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61034 () Bool)

(assert start!61034)

(declare-fun b!275089 () Bool)

(declare-fun res!228801 () Bool)

(declare-fun e!194986 () Bool)

(assert (=> b!275089 (=> (not res!228801) (not e!194986))))

(declare-datatypes ((array!15660 0))(
  ( (array!15661 (arr!7770 (Array (_ BitVec 32) (_ BitVec 8))) (size!6783 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12380 0))(
  ( (BitStream!12381 (buf!7251 array!15660) (currentByte!13409 (_ BitVec 32)) (currentBit!13404 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12380)

(declare-fun diffInBits!14 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275089 (= res!228801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd (bitIndex!0 (size!6783 (buf!7251 b!177)) (currentByte!13409 b!177) (currentBit!13404 b!177)) diffInBits!14)))))

(declare-fun b!275088 () Bool)

(declare-fun e!194987 () Bool)

(assert (=> b!275088 (= e!194987 e!194986)))

(declare-fun res!228802 () Bool)

(assert (=> b!275088 (=> (not res!228802) (not e!194986))))

(declare-fun lt!413465 () (_ BitVec 64))

(assert (=> b!275088 (= res!228802 (bvsle diffInBits!14 lt!413465))))

(assert (=> b!275088 (= lt!413465 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6783 (buf!7251 b!177)))))))

(declare-fun b!275091 () Bool)

(declare-fun e!194988 () Bool)

(declare-fun array_inv!6507 (array!15660) Bool)

(assert (=> b!275091 (= e!194988 (array_inv!6507 (buf!7251 b!177)))))

(declare-fun res!228800 () Bool)

(assert (=> start!61034 (=> (not res!228800) (not e!194987))))

(assert (=> start!61034 (= res!228800 (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6783 (buf!7251 b!177)))) diffInBits!14))))

(assert (=> start!61034 e!194987))

(declare-fun inv!12 (BitStream!12380) Bool)

(assert (=> start!61034 (and (inv!12 b!177) e!194988)))

(assert (=> start!61034 true))

(declare-fun b!275090 () Bool)

(assert (=> b!275090 (= e!194986 (not (= ((_ sign_extend 32) (size!6783 (buf!7251 b!177))) (bvsdiv lt!413465 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!61034 res!228800) b!275088))

(assert (= (and b!275088 res!228802) b!275089))

(assert (= (and b!275089 res!228801) b!275090))

(assert (= start!61034 b!275091))

(declare-fun m!407639 () Bool)

(assert (=> b!275089 m!407639))

(declare-fun m!407641 () Bool)

(assert (=> b!275091 m!407641))

(declare-fun m!407643 () Bool)

(assert (=> start!61034 m!407643))

(push 1)

(assert (not b!275089))

(assert (not b!275091))

(assert (not start!61034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

