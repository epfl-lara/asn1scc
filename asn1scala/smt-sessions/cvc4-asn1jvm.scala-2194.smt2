; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55688 () Bool)

(assert start!55688)

(declare-fun b!258975 () Bool)

(declare-fun e!179647 () Bool)

(assert (=> b!258975 (= e!179647 false)))

(declare-fun lt!400817 () (_ BitVec 64))

(declare-datatypes ((array!14131 0))(
  ( (array!14132 (arr!7176 (Array (_ BitVec 32) (_ BitVec 8))) (size!6189 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11300 0))(
  ( (BitStream!11301 (buf!6711 array!14131) (currentByte!12340 (_ BitVec 32)) (currentBit!12335 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22164 0))(
  ( (tuple2!22165 (_1!12018 Bool) (_2!12018 BitStream!11300)) )
))
(declare-fun lt!400816 () tuple2!22164)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258975 (= lt!400817 (bitIndex!0 (size!6189 (buf!6711 (_2!12018 lt!400816))) (currentByte!12340 (_2!12018 lt!400816)) (currentBit!12335 (_2!12018 lt!400816))))))

(declare-fun lt!400815 () (_ BitVec 64))

(declare-fun thiss!1754 () BitStream!11300)

(assert (=> b!258975 (= lt!400815 (bitIndex!0 (size!6189 (buf!6711 thiss!1754)) (currentByte!12340 thiss!1754) (currentBit!12335 thiss!1754)))))

(declare-fun b!258976 () Bool)

(declare-fun e!179645 () Bool)

(assert (=> b!258976 (= e!179645 e!179647)))

(declare-fun res!216946 () Bool)

(assert (=> b!258976 (=> (not res!216946) (not e!179647))))

(declare-fun expected!109 () Bool)

(assert (=> b!258976 (= res!216946 (not (= (_1!12018 lt!400816) expected!109)))))

(declare-fun readBit!0 (BitStream!11300) tuple2!22164)

(assert (=> b!258976 (= lt!400816 (readBit!0 thiss!1754))))

(declare-fun res!216944 () Bool)

(assert (=> start!55688 (=> (not res!216944) (not e!179645))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55688 (= res!216944 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55688 e!179645))

(assert (=> start!55688 true))

(declare-fun e!179644 () Bool)

(declare-fun inv!12 (BitStream!11300) Bool)

(assert (=> start!55688 (and (inv!12 thiss!1754) e!179644)))

(declare-fun b!258977 () Bool)

(declare-fun res!216945 () Bool)

(assert (=> b!258977 (=> (not res!216945) (not e!179645))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258977 (= res!216945 (validate_offset_bits!1 ((_ sign_extend 32) (size!6189 (buf!6711 thiss!1754))) ((_ sign_extend 32) (currentByte!12340 thiss!1754)) ((_ sign_extend 32) (currentBit!12335 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258978 () Bool)

(declare-fun res!216943 () Bool)

(assert (=> b!258978 (=> (not res!216943) (not e!179645))))

(assert (=> b!258978 (= res!216943 (not (= from!526 nBits!535)))))

(declare-fun b!258979 () Bool)

(declare-fun array_inv!5930 (array!14131) Bool)

(assert (=> b!258979 (= e!179644 (array_inv!5930 (buf!6711 thiss!1754)))))

(assert (= (and start!55688 res!216944) b!258977))

(assert (= (and b!258977 res!216945) b!258978))

(assert (= (and b!258978 res!216943) b!258976))

(assert (= (and b!258976 res!216946) b!258975))

(assert (= start!55688 b!258979))

(declare-fun m!388331 () Bool)

(assert (=> b!258975 m!388331))

(declare-fun m!388333 () Bool)

(assert (=> b!258975 m!388333))

(declare-fun m!388335 () Bool)

(assert (=> b!258977 m!388335))

(declare-fun m!388337 () Bool)

(assert (=> b!258976 m!388337))

(declare-fun m!388339 () Bool)

(assert (=> b!258979 m!388339))

(declare-fun m!388341 () Bool)

(assert (=> start!55688 m!388341))

(push 1)

(assert (not b!258976))

(assert (not start!55688))

(assert (not b!258979))

(assert (not b!258975))

(assert (not b!258977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

