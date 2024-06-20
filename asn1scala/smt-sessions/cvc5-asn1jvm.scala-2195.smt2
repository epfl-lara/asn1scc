; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55690 () Bool)

(assert start!55690)

(declare-fun b!258990 () Bool)

(declare-fun e!179657 () Bool)

(declare-datatypes ((array!14133 0))(
  ( (array!14134 (arr!7177 (Array (_ BitVec 32) (_ BitVec 8))) (size!6190 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11302 0))(
  ( (BitStream!11303 (buf!6712 array!14133) (currentByte!12341 (_ BitVec 32)) (currentBit!12336 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11302)

(declare-fun array_inv!5931 (array!14133) Bool)

(assert (=> b!258990 (= e!179657 (array_inv!5931 (buf!6712 thiss!1754)))))

(declare-fun res!216957 () Bool)

(declare-fun e!179658 () Bool)

(assert (=> start!55690 (=> (not res!216957) (not e!179658))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55690 (= res!216957 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55690 e!179658))

(assert (=> start!55690 true))

(declare-fun inv!12 (BitStream!11302) Bool)

(assert (=> start!55690 (and (inv!12 thiss!1754) e!179657)))

(declare-fun b!258991 () Bool)

(declare-fun res!216956 () Bool)

(assert (=> b!258991 (=> (not res!216956) (not e!179658))))

(assert (=> b!258991 (= res!216956 (not (= from!526 nBits!535)))))

(declare-fun b!258992 () Bool)

(declare-fun e!179659 () Bool)

(assert (=> b!258992 (= e!179659 false)))

(declare-fun lt!400826 () (_ BitVec 64))

(declare-datatypes ((tuple2!22166 0))(
  ( (tuple2!22167 (_1!12019 Bool) (_2!12019 BitStream!11302)) )
))
(declare-fun lt!400825 () tuple2!22166)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258992 (= lt!400826 (bitIndex!0 (size!6190 (buf!6712 (_2!12019 lt!400825))) (currentByte!12341 (_2!12019 lt!400825)) (currentBit!12336 (_2!12019 lt!400825))))))

(declare-fun lt!400824 () (_ BitVec 64))

(assert (=> b!258992 (= lt!400824 (bitIndex!0 (size!6190 (buf!6712 thiss!1754)) (currentByte!12341 thiss!1754) (currentBit!12336 thiss!1754)))))

(declare-fun b!258993 () Bool)

(assert (=> b!258993 (= e!179658 e!179659)))

(declare-fun res!216958 () Bool)

(assert (=> b!258993 (=> (not res!216958) (not e!179659))))

(declare-fun expected!109 () Bool)

(assert (=> b!258993 (= res!216958 (not (= (_1!12019 lt!400825) expected!109)))))

(declare-fun readBit!0 (BitStream!11302) tuple2!22166)

(assert (=> b!258993 (= lt!400825 (readBit!0 thiss!1754))))

(declare-fun b!258994 () Bool)

(declare-fun res!216955 () Bool)

(assert (=> b!258994 (=> (not res!216955) (not e!179658))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258994 (= res!216955 (validate_offset_bits!1 ((_ sign_extend 32) (size!6190 (buf!6712 thiss!1754))) ((_ sign_extend 32) (currentByte!12341 thiss!1754)) ((_ sign_extend 32) (currentBit!12336 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55690 res!216957) b!258994))

(assert (= (and b!258994 res!216955) b!258991))

(assert (= (and b!258991 res!216956) b!258993))

(assert (= (and b!258993 res!216958) b!258992))

(assert (= start!55690 b!258990))

(declare-fun m!388343 () Bool)

(assert (=> b!258992 m!388343))

(declare-fun m!388345 () Bool)

(assert (=> b!258992 m!388345))

(declare-fun m!388347 () Bool)

(assert (=> b!258994 m!388347))

(declare-fun m!388349 () Bool)

(assert (=> b!258990 m!388349))

(declare-fun m!388351 () Bool)

(assert (=> b!258993 m!388351))

(declare-fun m!388353 () Bool)

(assert (=> start!55690 m!388353))

(push 1)

(assert (not b!258990))

(assert (not b!258993))

(assert (not start!55690))

(assert (not b!258994))

(assert (not b!258992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

