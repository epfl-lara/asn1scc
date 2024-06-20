; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27446 () Bool)

(assert start!27446)

(declare-fun b!141013 () Bool)

(declare-fun res!117592 () Bool)

(declare-fun e!93942 () Bool)

(assert (=> b!141013 (=> (not res!117592) (not e!93942))))

(declare-datatypes ((array!6461 0))(
  ( (array!6462 (arr!3631 (Array (_ BitVec 32) (_ BitVec 8))) (size!2924 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5106 0))(
  ( (BitStream!5107 (buf!3345 array!6461) (currentByte!6205 (_ BitVec 32)) (currentBit!6200 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5106)

(declare-datatypes ((Unit!8830 0))(
  ( (Unit!8831) )
))
(declare-datatypes ((tuple2!12424 0))(
  ( (tuple2!12425 (_1!6542 Unit!8830) (_2!6542 BitStream!5106)) )
))
(declare-fun lt!219245 () tuple2!12424)

(declare-fun isPrefixOf!0 (BitStream!5106 BitStream!5106) Bool)

(assert (=> b!141013 (= res!117592 (isPrefixOf!0 thiss!1634 (_2!6542 lt!219245)))))

(declare-fun b!141014 () Bool)

(declare-fun res!117595 () Bool)

(assert (=> b!141014 (=> (not res!117595) (not e!93942))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141014 (= res!117595 (= (bitIndex!0 (size!2924 (buf!3345 (_2!6542 lt!219245))) (currentByte!6205 (_2!6542 lt!219245)) (currentBit!6200 (_2!6542 lt!219245))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2924 (buf!3345 thiss!1634)) (currentByte!6205 thiss!1634) (currentBit!6200 thiss!1634)))))))

(declare-fun res!117593 () Bool)

(declare-fun e!93941 () Bool)

(assert (=> start!27446 (=> (not res!117593) (not e!93941))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6461)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27446 (= res!117593 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2924 arr!237))))))

(assert (=> start!27446 e!93941))

(assert (=> start!27446 true))

(declare-fun array_inv!2713 (array!6461) Bool)

(assert (=> start!27446 (array_inv!2713 arr!237)))

(declare-fun e!93944 () Bool)

(declare-fun inv!12 (BitStream!5106) Bool)

(assert (=> start!27446 (and (inv!12 thiss!1634) e!93944)))

(declare-fun b!141015 () Bool)

(assert (=> b!141015 (= e!93941 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141015 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2924 (buf!3345 (_2!6542 lt!219245)))) ((_ sign_extend 32) (currentByte!6205 (_2!6542 lt!219245))) ((_ sign_extend 32) (currentBit!6200 (_2!6542 lt!219245))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219242 () Unit!8830)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5106 BitStream!5106 (_ BitVec 64) (_ BitVec 32)) Unit!8830)

(assert (=> b!141015 (= lt!219242 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6542 lt!219245) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141015 e!93942))

(declare-fun res!117594 () Bool)

(assert (=> b!141015 (=> (not res!117594) (not e!93942))))

(assert (=> b!141015 (= res!117594 (= (size!2924 (buf!3345 thiss!1634)) (size!2924 (buf!3345 (_2!6542 lt!219245)))))))

(declare-fun appendByte!0 (BitStream!5106 (_ BitVec 8)) tuple2!12424)

(assert (=> b!141015 (= lt!219245 (appendByte!0 thiss!1634 (select (arr!3631 arr!237) from!447)))))

(declare-fun b!141016 () Bool)

(declare-fun res!117596 () Bool)

(assert (=> b!141016 (=> (not res!117596) (not e!93941))))

(assert (=> b!141016 (= res!117596 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2924 (buf!3345 thiss!1634))) ((_ sign_extend 32) (currentByte!6205 thiss!1634)) ((_ sign_extend 32) (currentBit!6200 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141017 () Bool)

(declare-fun res!117597 () Bool)

(assert (=> b!141017 (=> (not res!117597) (not e!93941))))

(assert (=> b!141017 (= res!117597 (bvslt from!447 to!404))))

(declare-fun b!141018 () Bool)

(declare-fun res!117598 () Bool)

(assert (=> b!141018 (=> (not res!117598) (not e!93941))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141018 (= res!117598 (invariant!0 (currentBit!6200 thiss!1634) (currentByte!6205 thiss!1634) (size!2924 (buf!3345 thiss!1634))))))

(declare-datatypes ((tuple2!12426 0))(
  ( (tuple2!12427 (_1!6543 BitStream!5106) (_2!6543 BitStream!5106)) )
))
(declare-fun lt!219244 () tuple2!12426)

(declare-fun b!141019 () Bool)

(declare-datatypes ((tuple2!12428 0))(
  ( (tuple2!12429 (_1!6544 BitStream!5106) (_2!6544 (_ BitVec 8))) )
))
(declare-fun lt!219243 () tuple2!12428)

(assert (=> b!141019 (= e!93942 (and (= (_2!6544 lt!219243) (select (arr!3631 arr!237) from!447)) (= (_1!6544 lt!219243) (_2!6543 lt!219244))))))

(declare-fun readBytePure!0 (BitStream!5106) tuple2!12428)

(assert (=> b!141019 (= lt!219243 (readBytePure!0 (_1!6543 lt!219244)))))

(declare-fun reader!0 (BitStream!5106 BitStream!5106) tuple2!12426)

(assert (=> b!141019 (= lt!219244 (reader!0 thiss!1634 (_2!6542 lt!219245)))))

(declare-fun b!141020 () Bool)

(assert (=> b!141020 (= e!93944 (array_inv!2713 (buf!3345 thiss!1634)))))

(assert (= (and start!27446 res!117593) b!141016))

(assert (= (and b!141016 res!117596) b!141017))

(assert (= (and b!141017 res!117597) b!141018))

(assert (= (and b!141018 res!117598) b!141015))

(assert (= (and b!141015 res!117594) b!141014))

(assert (= (and b!141014 res!117595) b!141013))

(assert (= (and b!141013 res!117592) b!141019))

(assert (= start!27446 b!141020))

(declare-fun m!216837 () Bool)

(assert (=> b!141016 m!216837))

(declare-fun m!216839 () Bool)

(assert (=> b!141018 m!216839))

(declare-fun m!216841 () Bool)

(assert (=> b!141015 m!216841))

(declare-fun m!216843 () Bool)

(assert (=> b!141015 m!216843))

(declare-fun m!216845 () Bool)

(assert (=> b!141015 m!216845))

(assert (=> b!141015 m!216845))

(declare-fun m!216847 () Bool)

(assert (=> b!141015 m!216847))

(declare-fun m!216849 () Bool)

(assert (=> b!141014 m!216849))

(declare-fun m!216851 () Bool)

(assert (=> b!141014 m!216851))

(declare-fun m!216853 () Bool)

(assert (=> b!141020 m!216853))

(declare-fun m!216855 () Bool)

(assert (=> b!141013 m!216855))

(declare-fun m!216857 () Bool)

(assert (=> start!27446 m!216857))

(declare-fun m!216859 () Bool)

(assert (=> start!27446 m!216859))

(assert (=> b!141019 m!216845))

(declare-fun m!216861 () Bool)

(assert (=> b!141019 m!216861))

(declare-fun m!216863 () Bool)

(assert (=> b!141019 m!216863))

(check-sat (not b!141018) (not b!141016) (not b!141013) (not b!141019) (not b!141020) (not b!141014) (not b!141015) (not start!27446))
(check-sat)
