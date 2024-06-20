; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27304 () Bool)

(assert start!27304)

(declare-fun b!140215 () Bool)

(declare-fun res!116899 () Bool)

(declare-fun e!93450 () Bool)

(assert (=> b!140215 (=> (not res!116899) (not e!93450))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6397 0))(
  ( (array!6398 (arr!3602 (Array (_ BitVec 32) (_ BitVec 8))) (size!2895 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5048 0))(
  ( (BitStream!5049 (buf!3316 array!6397) (currentByte!6158 (_ BitVec 32)) (currentBit!6153 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5048)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140215 (= res!116899 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2895 (buf!3316 thiss!1634))) ((_ sign_extend 32) (currentByte!6158 thiss!1634)) ((_ sign_extend 32) (currentBit!6153 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140216 () Bool)

(declare-fun res!116901 () Bool)

(assert (=> b!140216 (=> (not res!116901) (not e!93450))))

(assert (=> b!140216 (= res!116901 (bvslt from!447 to!404))))

(declare-fun b!140217 () Bool)

(declare-fun arr!237 () array!6397)

(assert (=> b!140217 (= e!93450 (bvsge from!447 (size!2895 arr!237)))))

(declare-fun res!116900 () Bool)

(assert (=> start!27304 (=> (not res!116900) (not e!93450))))

(assert (=> start!27304 (= res!116900 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2895 arr!237))))))

(assert (=> start!27304 e!93450))

(assert (=> start!27304 true))

(declare-fun array_inv!2684 (array!6397) Bool)

(assert (=> start!27304 (array_inv!2684 arr!237)))

(declare-fun e!93453 () Bool)

(declare-fun inv!12 (BitStream!5048) Bool)

(assert (=> start!27304 (and (inv!12 thiss!1634) e!93453)))

(declare-fun b!140218 () Bool)

(assert (=> b!140218 (= e!93453 (array_inv!2684 (buf!3316 thiss!1634)))))

(declare-fun b!140219 () Bool)

(declare-fun res!116902 () Bool)

(assert (=> b!140219 (=> (not res!116902) (not e!93450))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140219 (= res!116902 (invariant!0 (currentBit!6153 thiss!1634) (currentByte!6158 thiss!1634) (size!2895 (buf!3316 thiss!1634))))))

(assert (= (and start!27304 res!116900) b!140215))

(assert (= (and b!140215 res!116899) b!140216))

(assert (= (and b!140216 res!116901) b!140219))

(assert (= (and b!140219 res!116902) b!140217))

(assert (= start!27304 b!140218))

(declare-fun m!216013 () Bool)

(assert (=> b!140215 m!216013))

(declare-fun m!216015 () Bool)

(assert (=> start!27304 m!216015))

(declare-fun m!216017 () Bool)

(assert (=> start!27304 m!216017))

(declare-fun m!216019 () Bool)

(assert (=> b!140218 m!216019))

(declare-fun m!216021 () Bool)

(assert (=> b!140219 m!216021))

(push 1)

(assert (not b!140215))

(assert (not start!27304))

(assert (not b!140218))

(assert (not b!140219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

