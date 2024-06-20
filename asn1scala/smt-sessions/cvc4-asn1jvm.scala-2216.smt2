; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56208 () Bool)

(assert start!56208)

(declare-fun res!218083 () Bool)

(declare-fun e!180944 () Bool)

(assert (=> start!56208 (=> (not res!218083) (not e!180944))))

(declare-datatypes ((array!14299 0))(
  ( (array!14300 (arr!7242 (Array (_ BitVec 32) (_ BitVec 8))) (size!6255 (_ BitVec 32))) )
))
(declare-fun buf!79 () array!14299)

(declare-datatypes ((BitStream!11432 0))(
  ( (BitStream!11433 (buf!6777 array!14299) (currentByte!12470 (_ BitVec 32)) (currentBit!12465 (_ BitVec 32))) )
))
(declare-fun b1!100 () BitStream!11432)

(declare-fun bits!81 () (_ BitVec 64))

(assert (=> start!56208 (= res!218083 (and (= (size!6255 (buf!6777 b1!100)) (size!6255 buf!79)) (bvsge bits!81 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!56208 e!180944))

(declare-fun e!180945 () Bool)

(declare-fun inv!12 (BitStream!11432) Bool)

(assert (=> start!56208 (and (inv!12 b1!100) e!180945)))

(declare-fun array_inv!5996 (array!14299) Bool)

(assert (=> start!56208 (array_inv!5996 buf!79)))

(assert (=> start!56208 true))

(declare-fun b!260492 () Bool)

(declare-fun res!218082 () Bool)

(assert (=> b!260492 (=> (not res!218082) (not e!180944))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!260492 (= res!218082 (validate_offset_bits!1 ((_ sign_extend 32) (size!6255 (buf!6777 b1!100))) ((_ sign_extend 32) (currentByte!12470 b1!100)) ((_ sign_extend 32) (currentBit!12465 b1!100)) bits!81))))

(declare-fun b!260493 () Bool)

(assert (=> b!260493 (= e!180944 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!6255 buf!79)) ((_ sign_extend 32) (currentByte!12470 b1!100)) ((_ sign_extend 32) (currentBit!12465 b1!100)) bits!81)))))

(declare-fun b!260494 () Bool)

(assert (=> b!260494 (= e!180945 (array_inv!5996 (buf!6777 b1!100)))))

(assert (= (and start!56208 res!218083) b!260492))

(assert (= (and b!260492 res!218082) b!260493))

(assert (= start!56208 b!260494))

(declare-fun m!389789 () Bool)

(assert (=> start!56208 m!389789))

(declare-fun m!389791 () Bool)

(assert (=> start!56208 m!389791))

(declare-fun m!389793 () Bool)

(assert (=> b!260492 m!389793))

(declare-fun m!389795 () Bool)

(assert (=> b!260493 m!389795))

(declare-fun m!389797 () Bool)

(assert (=> b!260494 m!389797))

(push 1)

(assert (not b!260492))

(assert (not b!260493))

(assert (not start!56208))

(assert (not b!260494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

