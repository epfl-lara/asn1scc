; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42418 () Bool)

(assert start!42418)

(declare-fun res!167819 () Bool)

(declare-fun e!137502 () Bool)

(assert (=> start!42418 (=> (not res!167819) (not e!137502))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42418 (= res!167819 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42418 e!137502))

(assert (=> start!42418 true))

(declare-datatypes ((array!10132 0))(
  ( (array!10133 (arr!5393 (Array (_ BitVec 32) (_ BitVec 8))) (size!4463 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8034 0))(
  ( (BitStream!8035 (buf!4964 array!10132) (currentByte!9326 (_ BitVec 32)) (currentBit!9321 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8034)

(declare-fun e!137504 () Bool)

(declare-fun inv!12 (BitStream!8034) Bool)

(assert (=> start!42418 (and (inv!12 thiss!1204) e!137504)))

(declare-fun b!200454 () Bool)

(declare-fun res!167820 () Bool)

(assert (=> b!200454 (=> (not res!167820) (not e!137502))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200454 (= res!167820 (validate_offset_bits!1 ((_ sign_extend 32) (size!4463 (buf!4964 thiss!1204))) ((_ sign_extend 32) (currentByte!9326 thiss!1204)) ((_ sign_extend 32) (currentBit!9321 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200455 () Bool)

(assert (=> b!200455 (= e!137502 (and (not (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000))) (not (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))))

(declare-fun b!200456 () Bool)

(declare-fun array_inv!4204 (array!10132) Bool)

(assert (=> b!200456 (= e!137504 (array_inv!4204 (buf!4964 thiss!1204)))))

(assert (= (and start!42418 res!167819) b!200454))

(assert (= (and b!200454 res!167820) b!200455))

(assert (= start!42418 b!200456))

(declare-fun m!311275 () Bool)

(assert (=> start!42418 m!311275))

(declare-fun m!311277 () Bool)

(assert (=> b!200454 m!311277))

(declare-fun m!311279 () Bool)

(assert (=> b!200456 m!311279))

(check-sat (not b!200454) (not start!42418) (not b!200456))
(check-sat)
