; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56184 () Bool)

(assert start!56184)

(declare-fun res!218065 () Bool)

(declare-fun e!180910 () Bool)

(assert (=> start!56184 (=> (not res!218065) (not e!180910))))

(declare-datatypes ((array!14290 0))(
  ( (array!14291 (arr!7239 (Array (_ BitVec 32) (_ BitVec 8))) (size!6252 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11426 0))(
  ( (BitStream!11427 (buf!6774 array!14290) (currentByte!12464 (_ BitVec 32)) (currentBit!12459 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11426)

(declare-fun bits!81 () (_ BitVec 64))

(declare-fun buf!79 () array!14290)

(assert (=> start!56184 (= res!218065 (and (= (size!6252 (buf!6774 b1!100)) (size!6252 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56184 e!180910))

(declare-fun e!180908 () Bool)

(declare-fun inv!12 (BitStream!11426) Bool)

(assert (=> start!56184 (and (inv!12 b1!100) e!180908)))

(declare-fun array_inv!5993 (array!14290) Bool)

(assert (=> start!56184 (array_inv!5993 buf!79)))

(assert (=> start!56184 true))

(declare-fun b!260465 () Bool)

(declare-fun res!218064 () Bool)

(assert (=> b!260465 (=> (not res!218064) (not e!180910))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260465 (= res!218064 (validate_offset_bits!1 ((_ sign_extend 32) (size!6252 (buf!6774 b1!100))) ((_ sign_extend 32) (currentByte!12464 b1!100)) ((_ sign_extend 32) (currentBit!12459 b1!100)) bits!81))))

(declare-fun b!260466 () Bool)

(assert (=> b!260466 (= e!180910 (not (inv!12 (BitStream!11427 buf!79 (currentByte!12464 b1!100) (currentBit!12459 b1!100)))))))

(declare-fun b!260467 () Bool)

(assert (=> b!260467 (= e!180908 (array_inv!5993 (buf!6774 b1!100)))))

(assert (= (and start!56184 res!218065) b!260465))

(assert (= (and b!260465 res!218064) b!260466))

(assert (= start!56184 b!260467))

(declare-fun m!389741 () Bool)

(assert (=> start!56184 m!389741))

(declare-fun m!389743 () Bool)

(assert (=> start!56184 m!389743))

(declare-fun m!389745 () Bool)

(assert (=> b!260465 m!389745))

(declare-fun m!389747 () Bool)

(assert (=> b!260466 m!389747))

(declare-fun m!389749 () Bool)

(assert (=> b!260467 m!389749))

(push 1)

(assert (not b!260465))

(assert (not start!56184))

(assert (not b!260467))

(assert (not b!260466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87416 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!87416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6252 (buf!6774 b1!100))) ((_ sign_extend 32) (currentByte!12464 b1!100)) ((_ sign_extend 32) (currentBit!12459 b1!100)) bits!81) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6252 (buf!6774 b1!100))) ((_ sign_extend 32) (currentByte!12464 b1!100)) ((_ sign_extend 32) (currentBit!12459 b1!100))) bits!81))))

(declare-fun bs!22151 () Bool)

(assert (= bs!22151 d!87416))

(declare-fun m!389757 () Bool)

(assert (=> bs!22151 m!389757))

(assert (=> b!260465 d!87416))

(declare-fun d!87422 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!87422 (= (inv!12 b1!100) (invariant!0 (currentBit!12459 b1!100) (currentByte!12464 b1!100) (size!6252 (buf!6774 b1!100))))))

(declare-fun bs!22154 () Bool)

(assert (= bs!22154 d!87422))

(declare-fun m!389763 () Bool)

(assert (=> bs!22154 m!389763))

(assert (=> start!56184 d!87422))

(declare-fun d!87434 () Bool)

(assert (=> d!87434 (= (array_inv!5993 buf!79) (bvsge (size!6252 buf!79) #b00000000000000000000000000000000))))

(assert (=> start!56184 d!87434))

(declare-fun d!87436 () Bool)

