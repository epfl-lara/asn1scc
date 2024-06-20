; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72326 () Bool)

(assert start!72326)

(declare-fun res!265966 () Bool)

(declare-fun e!233416 () Bool)

(assert (=> start!72326 (=> (not res!265966) (not e!233416))))

(declare-datatypes ((array!20720 0))(
  ( (array!20721 (arr!10110 (Array (_ BitVec 32) (_ BitVec 8))) (size!9018 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14198 0))(
  ( (BitStream!14199 (buf!8160 array!20720) (currentByte!15053 (_ BitVec 32)) (currentBit!15048 (_ BitVec 32))) )
))
(declare-fun thiss!1711 () BitStream!14198)

(assert (=> start!72326 (= res!265966 (and (bvsle ((_ sign_extend 32) (size!9018 (buf!8160 thiss!1711))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15053 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15048 thiss!1711)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9018 (buf!8160 thiss!1711))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15053 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15048 thiss!1711)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!72326 e!233416))

(declare-fun e!233417 () Bool)

(declare-fun inv!12 (BitStream!14198) Bool)

(assert (=> start!72326 (and (inv!12 thiss!1711) e!233417)))

(declare-fun b!324000 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324000 (= e!233416 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15048 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15053 thiss!1711))) ((_ extract 31 0) ((_ sign_extend 32) (size!9018 (buf!8160 thiss!1711)))))))))

(declare-fun b!324001 () Bool)

(declare-fun array_inv!8570 (array!20720) Bool)

(assert (=> b!324001 (= e!233417 (array_inv!8570 (buf!8160 thiss!1711)))))

(assert (= (and start!72326 res!265966) b!324000))

(assert (= start!72326 b!324001))

(declare-fun m!462057 () Bool)

(assert (=> start!72326 m!462057))

(declare-fun m!462059 () Bool)

(assert (=> b!324000 m!462059))

(declare-fun m!462061 () Bool)

(assert (=> b!324001 m!462061))

(push 1)

(assert (not b!324001))

(assert (not start!72326))

(assert (not b!324000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun 