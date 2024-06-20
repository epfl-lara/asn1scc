; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55694 () Bool)

(assert start!55694)

(declare-fun b!259020 () Bool)

(declare-fun res!216980 () Bool)

(declare-fun e!179682 () Bool)

(assert (=> b!259020 (=> (not res!216980) (not e!179682))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14137 0))(
  ( (array!14138 (arr!7179 (Array (_ BitVec 32) (_ BitVec 8))) (size!6192 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11306 0))(
  ( (BitStream!11307 (buf!6714 array!14137) (currentByte!12343 (_ BitVec 32)) (currentBit!12338 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11306)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259020 (= res!216980 (validate_offset_bits!1 ((_ sign_extend 32) (size!6192 (buf!6714 thiss!1754))) ((_ sign_extend 32) (currentByte!12343 thiss!1754)) ((_ sign_extend 32) (currentBit!12338 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!259021 () Bool)

(declare-fun e!179680 () Bool)

(assert (=> b!259021 (= e!179682 e!179680)))

(declare-fun res!216982 () Bool)

(assert (=> b!259021 (=> (not res!216982) (not e!179680))))

(declare-datatypes ((tuple2!22170 0))(
  ( (tuple2!22171 (_1!12021 Bool) (_2!12021 BitStream!11306)) )
))
(declare-fun lt!400844 () tuple2!22170)

(declare-fun expected!109 () Bool)

(assert (=> b!259021 (= res!216982 (not (= (_1!12021 lt!400844) expected!109)))))

(declare-fun readBit!0 (BitStream!11306) tuple2!22170)

(assert (=> b!259021 (= lt!400844 (readBit!0 thiss!1754))))

(declare-fun b!259022 () Bool)

(declare-fun e!179681 () Bool)

(declare-fun array_inv!5933 (array!14137) Bool)

(assert (=> b!259022 (= e!179681 (array_inv!5933 (buf!6714 thiss!1754)))))

(declare-fun b!259023 () Bool)

(assert (=> b!259023 (= e!179680 false)))

(declare-fun lt!400842 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!259023 (= lt!400842 (bitIndex!0 (size!6192 (buf!6714 (_2!12021 lt!400844))) (currentByte!12343 (_2!12021 lt!400844)) (currentBit!12338 (_2!12021 lt!400844))))))

(declare-fun lt!400843 () (_ BitVec 64))

(assert (=> b!259023 (= lt!400843 (bitIndex!0 (size!6192 (buf!6714 thiss!1754)) (currentByte!12343 thiss!1754) (currentBit!12338 thiss!1754)))))

(declare-fun res!216979 () Bool)

(assert (=> start!55694 (=> (not res!216979) (not e!179682))))

(assert (=> start!55694 (= res!216979 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55694 e!179682))

(assert (=> start!55694 true))

(declare-fun inv!12 (BitStream!11306) Bool)

(assert (=> start!55694 (and (inv!12 thiss!1754) e!179681)))

(declare-fun b!259024 () Bool)

(declare-fun res!216981 () Bool)

(assert (=> b!259024 (=> (not res!216981) (not e!179682))))

(assert (=> b!259024 (= res!216981 (not (= from!526 nBits!535)))))

(assert (= (and start!55694 res!216979) b!259020))

(assert (= (and b!259020 res!216980) b!259024))

(assert (= (and b!259024 res!216981) b!259021))

(assert (= (and b!259021 res!216982) b!259023))

(assert (= start!55694 b!259022))

(declare-fun m!388367 () Bool)

(assert (=> start!55694 m!388367))

(declare-fun m!388369 () Bool)

(assert (=> b!259022 m!388369))

(declare-fun m!388371 () Bool)

(assert (=> b!259020 m!388371))

(declare-fun m!388373 () Bool)

(assert (=> b!259023 m!388373))

(declare-fun m!388375 () Bool)

(assert (=> b!259023 m!388375))

(declare-fun m!388377 () Bool)

(assert (=> b!259021 m!388377))

(push 1)

(assert (not start!55694))

(assert (not b!259020))

(assert (not b!259023))

(assert (not b!259021))

(assert (not b!259022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

