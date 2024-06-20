; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56156 () Bool)

(assert start!56156)

(declare-fun b!260437 () Bool)

(declare-fun res!218047 () Bool)

(declare-fun e!180874 () Bool)

(assert (=> b!260437 (=> (not res!218047) (not e!180874))))

(declare-datatypes ((array!14282 0))(
  ( (array!14283 (arr!7236 (Array (_ BitVec 32) (_ BitVec 8))) (size!6249 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11420 0))(
  ( (BitStream!11421 (buf!6771 array!14282) (currentByte!12455 (_ BitVec 32)) (currentBit!12450 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11420)

(declare-fun bits!81 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260437 (= res!218047 (validate_offset_bits!1 ((_ sign_extend 32) (size!6249 (buf!6771 b1!100))) ((_ sign_extend 32) (currentByte!12455 b1!100)) ((_ sign_extend 32) (currentBit!12450 b1!100)) bits!81))))

(declare-fun b!260440 () Bool)

(declare-fun e!180873 () Bool)

(declare-fun array_inv!5990 (array!14282) Bool)

(assert (=> b!260440 (= e!180873 (array_inv!5990 (buf!6771 b1!100)))))

(declare-fun b!260438 () Bool)

(declare-fun res!218046 () Bool)

(assert (=> b!260438 (=> (not res!218046) (not e!180874))))

(declare-fun buf!79 () array!14282)

(assert (=> b!260438 (= res!218046 (and (bvsle ((_ sign_extend 32) (size!6249 buf!79)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12455 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12450 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6249 buf!79)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12455 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12450 b1!100)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!260439 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!260439 (= e!180874 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12450 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12455 b1!100))) ((_ extract 31 0) ((_ sign_extend 32) (size!6249 buf!79))))))))

(declare-fun res!218045 () Bool)

(assert (=> start!56156 (=> (not res!218045) (not e!180874))))

(assert (=> start!56156 (= res!218045 (and (= (size!6249 (buf!6771 b1!100)) (size!6249 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56156 e!180874))

(declare-fun inv!12 (BitStream!11420) Bool)

(assert (=> start!56156 (and (inv!12 b1!100) e!180873)))

(assert (=> start!56156 (array_inv!5990 buf!79)))

(assert (=> start!56156 true))

(assert (= (and start!56156 res!218045) b!260437))

(assert (= (and b!260437 res!218047) b!260438))

(assert (= (and b!260438 res!218046) b!260439))

(assert (= start!56156 b!260440))

(declare-fun m!389701 () Bool)

(assert (=> b!260437 m!389701))

(declare-fun m!389703 () Bool)

(assert (=> b!260440 m!389703))

(declare-fun m!389705 () Bool)

(assert (=> b!260439 m!389705))

(declare-fun m!389707 () Bool)

(assert (=> start!56156 m!389707))

(declare-fun m!389709 () Bool)

(assert (=> start!56156 m!389709))

(push 1)

(assert (not b!260437))

(assert (not b!260439))

(assert (not start!56156))

(assert (not b!260440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

