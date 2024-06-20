; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56114 () Bool)

(assert start!56114)

(declare-fun res!217990 () Bool)

(declare-fun e!180778 () Bool)

(assert (=> start!56114 (=> (not res!217990) (not e!180778))))

(declare-datatypes ((array!14263 0))(
  ( (array!14264 (arr!7228 (Array (_ BitVec 32) (_ BitVec 8))) (size!6241 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14263)

(declare-datatypes ((BitStream!11404 0))(
  ( (BitStream!11405 (buf!6763 array!14263) (currentByte!12440 (_ BitVec 32)) (currentBit!12435 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11404)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56114 (= res!217990 (and (= (size!6241 (buf!6763 b1!100)) (size!6241 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56114 e!180778))

(declare-fun e!180776 () Bool)

(declare-fun inv!12 (BitStream!11404) Bool)

(assert (=> start!56114 (and (inv!12 b1!100) e!180776)))

(declare-fun array_inv!5982 (array!14263) Bool)

(assert (=> start!56114 (array_inv!5982 buf!79)))

(assert (=> start!56114 true))

(declare-fun b!260357 () Bool)

(declare-fun res!217989 () Bool)

(assert (=> b!260357 (=> (not res!217989) (not e!180778))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260357 (= res!217989 (validate_offset_bits!1 ((_ sign_extend 32) (size!6241 (buf!6763 b1!100))) ((_ sign_extend 32) (currentByte!12440 b1!100)) ((_ sign_extend 32) (currentBit!12435 b1!100)) bits!81))))

(declare-fun b!260358 () Bool)

(assert (=> b!260358 (= e!180778 (or (bvsgt ((_ sign_extend 32) (size!6241 buf!79)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12440 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12435 b1!100)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!260359 () Bool)

(assert (=> b!260359 (= e!180776 (array_inv!5982 (buf!6763 b1!100)))))

(assert (= (and start!56114 res!217990) b!260357))

(assert (= (and b!260357 res!217989) b!260358))

(assert (= start!56114 b!260359))

(declare-fun m!389621 () Bool)

(assert (=> start!56114 m!389621))

(declare-fun m!389623 () Bool)

(assert (=> start!56114 m!389623))

(declare-fun m!389625 () Bool)

(assert (=> b!260357 m!389625))

(declare-fun m!389627 () Bool)

(assert (=> b!260359 m!389627))

(push 1)

(assert (not b!260359))

(assert (not start!56114))

(assert (not b!260357))

(check-sat)

(pop 1)

