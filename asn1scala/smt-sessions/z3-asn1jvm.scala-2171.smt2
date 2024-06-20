; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55128 () Bool)

(assert start!55128)

(declare-fun res!215563 () Bool)

(declare-fun e!178321 () Bool)

(assert (=> start!55128 (=> (not res!215563) (not e!178321))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55128 (= res!215563 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55128 e!178321))

(assert (=> start!55128 true))

(declare-datatypes ((array!13964 0))(
  ( (array!13965 (arr!7109 (Array (_ BitVec 32) (_ BitVec 8))) (size!6122 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11166 0))(
  ( (BitStream!11167 (buf!6644 array!13964) (currentByte!12189 (_ BitVec 32)) (currentBit!12184 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11166)

(declare-fun e!178323 () Bool)

(declare-fun inv!12 (BitStream!11166) Bool)

(assert (=> start!55128 (and (inv!12 thiss!1754) e!178323)))

(declare-fun b!257199 () Bool)

(declare-fun res!215560 () Bool)

(assert (=> b!257199 (=> (not res!215560) (not e!178321))))

(assert (=> b!257199 (= res!215560 (not (= from!526 nBits!535)))))

(declare-fun b!257200 () Bool)

(declare-fun e!178322 () Bool)

(assert (=> b!257200 (= e!178321 e!178322)))

(declare-fun res!215562 () Bool)

(assert (=> b!257200 (=> (not res!215562) (not e!178322))))

(declare-datatypes ((tuple2!21994 0))(
  ( (tuple2!21995 (_1!11933 Bool) (_2!11933 BitStream!11166)) )
))
(declare-fun lt!398582 () tuple2!21994)

(declare-fun expected!109 () Bool)

(assert (=> b!257200 (= res!215562 (not (= (_1!11933 lt!398582) expected!109)))))

(declare-fun readBit!0 (BitStream!11166) tuple2!21994)

(assert (=> b!257200 (= lt!398582 (readBit!0 thiss!1754))))

(declare-fun b!257201 () Bool)

(assert (=> b!257201 (= e!178322 false)))

(declare-fun lt!398581 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257201 (= lt!398581 (bitIndex!0 (size!6122 (buf!6644 (_2!11933 lt!398582))) (currentByte!12189 (_2!11933 lt!398582)) (currentBit!12184 (_2!11933 lt!398582))))))

(declare-fun lt!398580 () (_ BitVec 64))

(assert (=> b!257201 (= lt!398580 (bitIndex!0 (size!6122 (buf!6644 thiss!1754)) (currentByte!12189 thiss!1754) (currentBit!12184 thiss!1754)))))

(declare-fun b!257202 () Bool)

(declare-fun res!215561 () Bool)

(assert (=> b!257202 (=> (not res!215561) (not e!178321))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257202 (= res!215561 (validate_offset_bits!1 ((_ sign_extend 32) (size!6122 (buf!6644 thiss!1754))) ((_ sign_extend 32) (currentByte!12189 thiss!1754)) ((_ sign_extend 32) (currentBit!12184 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257203 () Bool)

(declare-fun array_inv!5863 (array!13964) Bool)

(assert (=> b!257203 (= e!178323 (array_inv!5863 (buf!6644 thiss!1754)))))

(assert (= (and start!55128 res!215563) b!257202))

(assert (= (and b!257202 res!215561) b!257199))

(assert (= (and b!257199 res!215560) b!257200))

(assert (= (and b!257200 res!215562) b!257201))

(assert (= start!55128 b!257203))

(declare-fun m!386753 () Bool)

(assert (=> b!257201 m!386753))

(declare-fun m!386755 () Bool)

(assert (=> b!257201 m!386755))

(declare-fun m!386757 () Bool)

(assert (=> b!257203 m!386757))

(declare-fun m!386759 () Bool)

(assert (=> b!257200 m!386759))

(declare-fun m!386761 () Bool)

(assert (=> start!55128 m!386761))

(declare-fun m!386763 () Bool)

(assert (=> b!257202 m!386763))

(check-sat (not start!55128) (not b!257203) (not b!257202) (not b!257200) (not b!257201))
