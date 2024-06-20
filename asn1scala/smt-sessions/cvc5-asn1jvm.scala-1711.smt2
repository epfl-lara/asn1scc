; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47330 () Bool)

(assert start!47330)

(declare-fun b!225788 () Bool)

(declare-fun res!189474 () Bool)

(declare-fun e!154222 () Bool)

(assert (=> b!225788 (=> (not res!189474) (not e!154222))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225788 (= res!189474 (bvslt i!761 to!496))))

(declare-fun b!225789 () Bool)

(declare-fun e!154218 () Bool)

(assert (=> b!225789 (= e!154222 e!154218)))

(declare-fun res!189472 () Bool)

(assert (=> b!225789 (=> (not res!189472) (not e!154218))))

(declare-datatypes ((array!11258 0))(
  ( (array!11259 (arr!5896 (Array (_ BitVec 32) (_ BitVec 8))) (size!4939 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8974 0))(
  ( (BitStream!8975 (buf!5480 array!11258) (currentByte!10276 (_ BitVec 32)) (currentBit!10271 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8974)

(declare-datatypes ((tuple2!19322 0))(
  ( (tuple2!19323 (_1!10448 (_ BitVec 8)) (_2!10448 BitStream!8974)) )
))
(declare-fun lt!358913 () tuple2!19322)

(assert (=> b!225789 (= res!189472 (= (size!4939 (buf!5480 thiss!1870)) (size!4939 (buf!5480 (_2!10448 lt!358913)))))))

(declare-fun readByte!0 (BitStream!8974) tuple2!19322)

(assert (=> b!225789 (= lt!358913 (readByte!0 thiss!1870))))

(declare-fun b!225790 () Bool)

(declare-fun e!154220 () Bool)

(declare-fun array_inv!4680 (array!11258) Bool)

(assert (=> b!225790 (= e!154220 (array_inv!4680 (buf!5480 thiss!1870)))))

(declare-fun res!189475 () Bool)

(assert (=> start!47330 (=> (not res!189475) (not e!154222))))

(declare-fun arr!308 () array!11258)

(assert (=> start!47330 (= res!189475 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4939 arr!308))))))

(assert (=> start!47330 e!154222))

(assert (=> start!47330 true))

(assert (=> start!47330 (array_inv!4680 arr!308)))

(declare-fun inv!12 (BitStream!8974) Bool)

(assert (=> start!47330 (and (inv!12 thiss!1870) e!154220)))

(declare-fun b!225791 () Bool)

(assert (=> b!225791 (= e!154218 false)))

(declare-fun lt!358914 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225791 (= lt!358914 (bitIndex!0 (size!4939 (buf!5480 (_2!10448 lt!358913))) (currentByte!10276 (_2!10448 lt!358913)) (currentBit!10271 (_2!10448 lt!358913))))))

(declare-fun b!225792 () Bool)

(declare-fun res!189473 () Bool)

(assert (=> b!225792 (=> (not res!189473) (not e!154222))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225792 (= res!189473 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4939 (buf!5480 thiss!1870))) ((_ sign_extend 32) (currentByte!10276 thiss!1870)) ((_ sign_extend 32) (currentBit!10271 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47330 res!189475) b!225792))

(assert (= (and b!225792 res!189473) b!225788))

(assert (= (and b!225788 res!189474) b!225789))

(assert (= (and b!225789 res!189472) b!225791))

(assert (= start!47330 b!225790))

(declare-fun m!346843 () Bool)

(assert (=> b!225791 m!346843))

(declare-fun m!346845 () Bool)

(assert (=> b!225789 m!346845))

(declare-fun m!346847 () Bool)

(assert (=> b!225790 m!346847))

(declare-fun m!346849 () Bool)

(assert (=> start!47330 m!346849))

(declare-fun m!346851 () Bool)

(assert (=> start!47330 m!346851))

(declare-fun m!346853 () Bool)

(assert (=> b!225792 m!346853))

(push 1)

(assert (not b!225791))

(assert (not start!47330))

(assert (not b!225792))

(assert (not b!225790))

(assert (not b!225789))

(check-sat)

