; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71538 () Bool)

(assert start!71538)

(declare-fun res!264031 () Bool)

(declare-fun e!231734 () Bool)

(assert (=> start!71538 (=> (not res!264031) (not e!231734))))

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(assert (=> start!71538 (= res!264031 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000)))))

(assert (=> start!71538 e!231734))

(assert (=> start!71538 true))

(declare-datatypes ((array!20452 0))(
  ( (array!20453 (arr!9996 (Array (_ BitVec 32) (_ BitVec 8))) (size!8904 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13970 0))(
  ( (BitStream!13971 (buf!8046 array!20452) (currentByte!14843 (_ BitVec 32)) (currentBit!14838 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13970)

(declare-fun e!231733 () Bool)

(declare-fun inv!12 (BitStream!13970) Bool)

(assert (=> start!71538 (and (inv!12 thiss!1811) e!231733)))

(declare-fun b!321620 () Bool)

(declare-fun res!264030 () Bool)

(assert (=> b!321620 (=> (not res!264030) (not e!231734))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321620 (= res!264030 (validate_offset_bits!1 ((_ sign_extend 32) (size!8904 (buf!8046 thiss!1811))) ((_ sign_extend 32) (currentByte!14843 thiss!1811)) ((_ sign_extend 32) (currentBit!14838 thiss!1811)) ((_ sign_extend 32) (bvsub nBits!568 i!747))))))

(declare-fun b!321621 () Bool)

(assert (=> b!321621 (= e!231734 (and (not (= #b00000000000000000000000000000000 (bvand i!747 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 i!747) #b10000000000000000000000000000000)))))))

(declare-fun b!321622 () Bool)

(declare-fun array_inv!8456 (array!20452) Bool)

(assert (=> b!321622 (= e!231733 (array_inv!8456 (buf!8046 thiss!1811)))))

(assert (= (and start!71538 res!264031) b!321620))

(assert (= (and b!321620 res!264030) b!321621))

(assert (= start!71538 b!321622))

(declare-fun m!459969 () Bool)

(assert (=> start!71538 m!459969))

(declare-fun m!459971 () Bool)

(assert (=> b!321620 m!459971))

(declare-fun m!459973 () Bool)

(assert (=> b!321622 m!459973))

(push 1)

(assert (not b!321622))

(assert (not b!321620))

(assert (not start!71538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

