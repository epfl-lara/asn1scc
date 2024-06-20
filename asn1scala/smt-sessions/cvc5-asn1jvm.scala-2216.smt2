; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56204 () Bool)

(assert start!56204)

(declare-fun res!218070 () Bool)

(declare-fun e!180922 () Bool)

(assert (=> start!56204 (=> (not res!218070) (not e!180922))))

(declare-datatypes ((array!14295 0))(
  ( (array!14296 (arr!7240 (Array (_ BitVec 32) (_ BitVec 8))) (size!6253 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14295)

(declare-datatypes ((BitStream!11428 0))(
  ( (BitStream!11429 (buf!6775 array!14295) (currentByte!12468 (_ BitVec 32)) (currentBit!12463 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11428)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56204 (= res!218070 (and (= (size!6253 (buf!6775 b1!100)) (size!6253 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56204 e!180922))

(declare-fun e!180920 () Bool)

(declare-fun inv!12 (BitStream!11428) Bool)

(assert (=> start!56204 (and (inv!12 b1!100) e!180920)))

(declare-fun array_inv!5994 (array!14295) Bool)

(assert (=> start!56204 (array_inv!5994 buf!79)))

(assert (=> start!56204 true))

(declare-fun b!260474 () Bool)

(declare-fun res!218071 () Bool)

(assert (=> b!260474 (=> (not res!218071) (not e!180922))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260474 (= res!218071 (validate_offset_bits!1 ((_ sign_extend 32) (size!6253 (buf!6775 b1!100))) ((_ sign_extend 32) (currentByte!12468 b1!100)) ((_ sign_extend 32) (currentBit!12463 b1!100)) bits!81))))

(declare-fun b!260475 () Bool)

(assert (=> b!260475 (= e!180922 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!6253 buf!79)) ((_ sign_extend 32) (currentByte!12468 b1!100)) ((_ sign_extend 32) (currentBit!12463 b1!100)) bits!81)))))

(declare-fun b!260476 () Bool)

(assert (=> b!260476 (= e!180920 (array_inv!5994 (buf!6775 b1!100)))))

(assert (= (and start!56204 res!218070) b!260474))

(assert (= (and b!260474 res!218071) b!260475))

(assert (= start!56204 b!260476))

(declare-fun m!389769 () Bool)

(assert (=> start!56204 m!389769))

(declare-fun m!389771 () Bool)

(assert (=> start!56204 m!389771))

(declare-fun m!389773 () Bool)

(assert (=> b!260474 m!389773))

(declare-fun m!389775 () Bool)

(assert (=> b!260475 m!389775))

(declare-fun m!389777 () Bool)

(assert (=> b!260476 m!389777))

(push 1)

(assert (not start!56204))

(assert (not b!260476))

(assert (not b!260475))

(assert (not b!260474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

