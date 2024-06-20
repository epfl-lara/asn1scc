; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71382 () Bool)

(assert start!71382)

(declare-fun res!263944 () Bool)

(declare-fun e!231517 () Bool)

(assert (=> start!71382 (=> (not res!263944) (not e!231517))))

(declare-datatypes ((array!20388 0))(
  ( (array!20389 (arr!9970 (Array (_ BitVec 32) (_ BitVec 8))) (size!8878 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13918 0))(
  ( (BitStream!13919 (buf!8020 array!20388) (currentByte!14793 (_ BitVec 32)) (currentBit!14788 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13918)

(assert (=> start!71382 (= res!263944 (and (bvsle ((_ sign_extend 32) (size!8878 (buf!8020 thiss!1701))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14793 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14788 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8878 (buf!8020 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14793 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14788 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71382 e!231517))

(declare-fun e!231518 () Bool)

(declare-fun inv!12 (BitStream!13918) Bool)

(assert (=> start!71382 (and (inv!12 thiss!1701) e!231518)))

(declare-fun b!321456 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321456 (= e!231517 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14788 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14793 thiss!1701))) ((_ extract 31 0) ((_ sign_extend 32) (size!8878 (buf!8020 thiss!1701)))))))))

(declare-fun b!321457 () Bool)

(declare-fun array_inv!8430 (array!20388) Bool)

(assert (=> b!321457 (= e!231518 (array_inv!8430 (buf!8020 thiss!1701)))))

(assert (= (and start!71382 res!263944) b!321456))

(assert (= start!71382 b!321457))

(declare-fun m!459787 () Bool)

(assert (=> start!71382 m!459787))

(declare-fun m!459789 () Bool)

(assert (=> b!321456 m!459789))

(declare-fun m!459791 () Bool)

(assert (=> b!321457 m!459791))

(push 1)

(assert (not b!321457))

(assert (not start!71382))

(assert (not b!321456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

