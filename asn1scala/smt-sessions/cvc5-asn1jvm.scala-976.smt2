; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27444 () Bool)

(assert start!27444)

(declare-fun b!140989 () Bool)

(declare-fun res!117575 () Bool)

(declare-fun e!93929 () Bool)

(assert (=> b!140989 (=> (not res!117575) (not e!93929))))

(declare-datatypes ((array!6459 0))(
  ( (array!6460 (arr!3630 (Array (_ BitVec 32) (_ BitVec 8))) (size!2923 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5104 0))(
  ( (BitStream!5105 (buf!3344 array!6459) (currentByte!6204 (_ BitVec 32)) (currentBit!6199 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5104)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140989 (= res!117575 (invariant!0 (currentBit!6199 thiss!1634) (currentByte!6204 thiss!1634) (size!2923 (buf!3344 thiss!1634))))))

(declare-fun res!117576 () Bool)

(assert (=> start!27444 (=> (not res!117576) (not e!93929))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6459)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27444 (= res!117576 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2923 arr!237))))))

(assert (=> start!27444 e!93929))

(assert (=> start!27444 true))

(declare-fun array_inv!2712 (array!6459) Bool)

(assert (=> start!27444 (array_inv!2712 arr!237)))

(declare-fun e!93926 () Bool)

(declare-fun inv!12 (BitStream!5104) Bool)

(assert (=> start!27444 (and (inv!12 thiss!1634) e!93926)))

(declare-datatypes ((tuple2!12418 0))(
  ( (tuple2!12419 (_1!6539 BitStream!5104) (_2!6539 (_ BitVec 8))) )
))
(declare-fun lt!219233 () tuple2!12418)

(declare-fun b!140990 () Bool)

(declare-datatypes ((tuple2!12420 0))(
  ( (tuple2!12421 (_1!6540 BitStream!5104) (_2!6540 BitStream!5104)) )
))
(declare-fun lt!219231 () tuple2!12420)

(declare-fun e!93930 () Bool)

(assert (=> b!140990 (= e!93930 (and (= (_2!6539 lt!219233) (select (arr!3630 arr!237) from!447)) (= (_1!6539 lt!219233) (_2!6540 lt!219231))))))

(declare-fun readBytePure!0 (BitStream!5104) tuple2!12418)

(assert (=> b!140990 (= lt!219233 (readBytePure!0 (_1!6540 lt!219231)))))

(declare-datatypes ((Unit!8828 0))(
  ( (Unit!8829) )
))
(declare-datatypes ((tuple2!12422 0))(
  ( (tuple2!12423 (_1!6541 Unit!8828) (_2!6541 BitStream!5104)) )
))
(declare-fun lt!219232 () tuple2!12422)

(declare-fun reader!0 (BitStream!5104 BitStream!5104) tuple2!12420)

(assert (=> b!140990 (= lt!219231 (reader!0 thiss!1634 (_2!6541 lt!219232)))))

(declare-fun b!140991 () Bool)

(assert (=> b!140991 (= e!93929 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140991 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2923 (buf!3344 (_2!6541 lt!219232)))) ((_ sign_extend 32) (currentByte!6204 (_2!6541 lt!219232))) ((_ sign_extend 32) (currentBit!6199 (_2!6541 lt!219232))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219230 () Unit!8828)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5104 BitStream!5104 (_ BitVec 64) (_ BitVec 32)) Unit!8828)

(assert (=> b!140991 (= lt!219230 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6541 lt!219232) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!140991 e!93930))

(declare-fun res!117572 () Bool)

(assert (=> b!140991 (=> (not res!117572) (not e!93930))))

(assert (=> b!140991 (= res!117572 (= (size!2923 (buf!3344 thiss!1634)) (size!2923 (buf!3344 (_2!6541 lt!219232)))))))

(declare-fun appendByte!0 (BitStream!5104 (_ BitVec 8)) tuple2!12422)

(assert (=> b!140991 (= lt!219232 (appendByte!0 thiss!1634 (select (arr!3630 arr!237) from!447)))))

(declare-fun b!140992 () Bool)

(declare-fun res!117573 () Bool)

(assert (=> b!140992 (=> (not res!117573) (not e!93930))))

(declare-fun isPrefixOf!0 (BitStream!5104 BitStream!5104) Bool)

(assert (=> b!140992 (= res!117573 (isPrefixOf!0 thiss!1634 (_2!6541 lt!219232)))))

(declare-fun b!140993 () Bool)

(declare-fun res!117577 () Bool)

(assert (=> b!140993 (=> (not res!117577) (not e!93930))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140993 (= res!117577 (= (bitIndex!0 (size!2923 (buf!3344 (_2!6541 lt!219232))) (currentByte!6204 (_2!6541 lt!219232)) (currentBit!6199 (_2!6541 lt!219232))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2923 (buf!3344 thiss!1634)) (currentByte!6204 thiss!1634) (currentBit!6199 thiss!1634)))))))

(declare-fun b!140994 () Bool)

(declare-fun res!117571 () Bool)

(assert (=> b!140994 (=> (not res!117571) (not e!93929))))

(assert (=> b!140994 (= res!117571 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2923 (buf!3344 thiss!1634))) ((_ sign_extend 32) (currentByte!6204 thiss!1634)) ((_ sign_extend 32) (currentBit!6199 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140995 () Bool)

(assert (=> b!140995 (= e!93926 (array_inv!2712 (buf!3344 thiss!1634)))))

(declare-fun b!140996 () Bool)

(declare-fun res!117574 () Bool)

(assert (=> b!140996 (=> (not res!117574) (not e!93929))))

(assert (=> b!140996 (= res!117574 (bvslt from!447 to!404))))

(assert (= (and start!27444 res!117576) b!140994))

(assert (= (and b!140994 res!117571) b!140996))

(assert (= (and b!140996 res!117574) b!140989))

(assert (= (and b!140989 res!117575) b!140991))

(assert (= (and b!140991 res!117572) b!140993))

(assert (= (and b!140993 res!117577) b!140992))

(assert (= (and b!140992 res!117573) b!140990))

(assert (= start!27444 b!140995))

(declare-fun m!216809 () Bool)

(assert (=> b!140993 m!216809))

(declare-fun m!216811 () Bool)

(assert (=> b!140993 m!216811))

(declare-fun m!216813 () Bool)

(assert (=> b!140990 m!216813))

(declare-fun m!216815 () Bool)

(assert (=> b!140990 m!216815))

(declare-fun m!216817 () Bool)

(assert (=> b!140990 m!216817))

(declare-fun m!216819 () Bool)

(assert (=> b!140994 m!216819))

(declare-fun m!216821 () Bool)

(assert (=> start!27444 m!216821))

(declare-fun m!216823 () Bool)

(assert (=> start!27444 m!216823))

(declare-fun m!216825 () Bool)

(assert (=> b!140995 m!216825))

(declare-fun m!216827 () Bool)

(assert (=> b!140989 m!216827))

(declare-fun m!216829 () Bool)

(assert (=> b!140991 m!216829))

(declare-fun m!216831 () Bool)

(assert (=> b!140991 m!216831))

(assert (=> b!140991 m!216813))

(assert (=> b!140991 m!216813))

(declare-fun m!216833 () Bool)

(assert (=> b!140991 m!216833))

(declare-fun m!216835 () Bool)

(assert (=> b!140992 m!216835))

(push 1)

(assert (not b!140993))

(assert (not start!27444))

(assert (not b!140992))

(assert (not b!140994))

(assert (not b!140995))

(assert (not b!140989))

(assert (not b!140990))

(assert (not b!140991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

