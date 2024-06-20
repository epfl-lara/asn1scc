; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53716 () Bool)

(assert start!53716)

(declare-fun b!249845 () Bool)

(declare-fun e!173163 () Bool)

(declare-fun e!173164 () Bool)

(assert (=> b!249845 (= e!173163 e!173164)))

(declare-fun res!209117 () Bool)

(assert (=> b!249845 (=> res!209117 e!173164)))

(declare-datatypes ((array!13625 0))(
  ( (array!13626 (arr!6963 (Array (_ BitVec 32) (_ BitVec 8))) (size!5976 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10874 0))(
  ( (BitStream!10875 (buf!6469 array!13625) (currentByte!11900 (_ BitVec 32)) (currentBit!11895 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18088 0))(
  ( (Unit!18089) )
))
(declare-datatypes ((tuple2!21410 0))(
  ( (tuple2!21411 (_1!11630 Unit!18088) (_2!11630 BitStream!10874)) )
))
(declare-fun lt!388453 () tuple2!21410)

(declare-fun lt!388454 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249845 (= res!209117 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5976 (buf!6469 (_2!11630 lt!388453)))) ((_ sign_extend 32) (currentByte!11900 (_2!11630 lt!388453))) ((_ sign_extend 32) (currentBit!11895 (_2!11630 lt!388453))) lt!388454)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!249845 (= lt!388454 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!249846 () Bool)

(assert (=> b!249846 (= e!173164 (bvslt lt!388454 (bvsub nBits!297 from!289)))))

(declare-fun b!249847 () Bool)

(declare-fun e!173165 () Bool)

(declare-fun thiss!1005 () BitStream!10874)

(declare-fun array_inv!5717 (array!13625) Bool)

(assert (=> b!249847 (= e!173165 (array_inv!5717 (buf!6469 thiss!1005)))))

(declare-fun b!249848 () Bool)

(declare-fun e!173161 () Bool)

(declare-datatypes ((tuple2!21412 0))(
  ( (tuple2!21413 (_1!11631 BitStream!10874) (_2!11631 Bool)) )
))
(declare-fun lt!388456 () tuple2!21412)

(declare-fun lt!388455 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249848 (= e!173161 (= (bitIndex!0 (size!5976 (buf!6469 (_1!11631 lt!388456))) (currentByte!11900 (_1!11631 lt!388456)) (currentBit!11895 (_1!11631 lt!388456))) lt!388455))))

(declare-fun b!249850 () Bool)

(declare-fun res!209122 () Bool)

(declare-fun e!173162 () Bool)

(assert (=> b!249850 (=> (not res!209122) (not e!173162))))

(assert (=> b!249850 (= res!209122 (validate_offset_bits!1 ((_ sign_extend 32) (size!5976 (buf!6469 thiss!1005))) ((_ sign_extend 32) (currentByte!11900 thiss!1005)) ((_ sign_extend 32) (currentBit!11895 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249851 () Bool)

(assert (=> b!249851 (= e!173162 (not e!173163))))

(declare-fun res!209120 () Bool)

(assert (=> b!249851 (=> res!209120 e!173163)))

(assert (=> b!249851 (= res!209120 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!249851 (validate_offset_bits!1 ((_ sign_extend 32) (size!5976 (buf!6469 (_2!11630 lt!388453)))) ((_ sign_extend 32) (currentByte!11900 (_2!11630 lt!388453))) ((_ sign_extend 32) (currentBit!11895 (_2!11630 lt!388453))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388458 () Unit!18088)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10874 BitStream!10874 (_ BitVec 64) (_ BitVec 64)) Unit!18088)

(assert (=> b!249851 (= lt!388458 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11630 lt!388453) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173160 () Bool)

(assert (=> b!249851 e!173160))

(declare-fun res!209121 () Bool)

(assert (=> b!249851 (=> (not res!209121) (not e!173160))))

(assert (=> b!249851 (= res!209121 (= (size!5976 (buf!6469 thiss!1005)) (size!5976 (buf!6469 (_2!11630 lt!388453)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10874 Bool) tuple2!21410)

(assert (=> b!249851 (= lt!388453 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249852 () Bool)

(declare-fun e!173159 () Bool)

(assert (=> b!249852 (= e!173160 e!173159)))

(declare-fun res!209123 () Bool)

(assert (=> b!249852 (=> (not res!209123) (not e!173159))))

(declare-fun lt!388457 () (_ BitVec 64))

(assert (=> b!249852 (= res!209123 (= lt!388455 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388457)))))

(assert (=> b!249852 (= lt!388455 (bitIndex!0 (size!5976 (buf!6469 (_2!11630 lt!388453))) (currentByte!11900 (_2!11630 lt!388453)) (currentBit!11895 (_2!11630 lt!388453))))))

(assert (=> b!249852 (= lt!388457 (bitIndex!0 (size!5976 (buf!6469 thiss!1005)) (currentByte!11900 thiss!1005) (currentBit!11895 thiss!1005)))))

(declare-fun b!249853 () Bool)

(declare-fun res!209118 () Bool)

(assert (=> b!249853 (=> (not res!209118) (not e!173159))))

(declare-fun isPrefixOf!0 (BitStream!10874 BitStream!10874) Bool)

(assert (=> b!249853 (= res!209118 (isPrefixOf!0 thiss!1005 (_2!11630 lt!388453)))))

(declare-fun b!249854 () Bool)

(declare-fun res!209116 () Bool)

(assert (=> b!249854 (=> (not res!209116) (not e!173162))))

(assert (=> b!249854 (= res!209116 (bvslt from!289 nBits!297))))

(declare-fun b!249849 () Bool)

(assert (=> b!249849 (= e!173159 e!173161)))

(declare-fun res!209119 () Bool)

(assert (=> b!249849 (=> (not res!209119) (not e!173161))))

(assert (=> b!249849 (= res!209119 (and (= (_2!11631 lt!388456) bit!26) (= (_1!11631 lt!388456) (_2!11630 lt!388453))))))

(declare-fun readBitPure!0 (BitStream!10874) tuple2!21412)

(declare-fun readerFrom!0 (BitStream!10874 (_ BitVec 32) (_ BitVec 32)) BitStream!10874)

(assert (=> b!249849 (= lt!388456 (readBitPure!0 (readerFrom!0 (_2!11630 lt!388453) (currentBit!11895 thiss!1005) (currentByte!11900 thiss!1005))))))

(declare-fun res!209124 () Bool)

(assert (=> start!53716 (=> (not res!209124) (not e!173162))))

(assert (=> start!53716 (= res!209124 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53716 e!173162))

(assert (=> start!53716 true))

(declare-fun inv!12 (BitStream!10874) Bool)

(assert (=> start!53716 (and (inv!12 thiss!1005) e!173165)))

(assert (= (and start!53716 res!209124) b!249850))

(assert (= (and b!249850 res!209122) b!249854))

(assert (= (and b!249854 res!209116) b!249851))

(assert (= (and b!249851 res!209121) b!249852))

(assert (= (and b!249852 res!209123) b!249853))

(assert (= (and b!249853 res!209118) b!249849))

(assert (= (and b!249849 res!209119) b!249848))

(assert (= (and b!249851 (not res!209120)) b!249845))

(assert (= (and b!249845 (not res!209117)) b!249846))

(assert (= start!53716 b!249847))

(declare-fun m!376231 () Bool)

(assert (=> b!249845 m!376231))

(declare-fun m!376233 () Bool)

(assert (=> b!249851 m!376233))

(declare-fun m!376235 () Bool)

(assert (=> b!249851 m!376235))

(declare-fun m!376237 () Bool)

(assert (=> b!249851 m!376237))

(declare-fun m!376239 () Bool)

(assert (=> start!53716 m!376239))

(declare-fun m!376241 () Bool)

(assert (=> b!249853 m!376241))

(declare-fun m!376243 () Bool)

(assert (=> b!249847 m!376243))

(declare-fun m!376245 () Bool)

(assert (=> b!249848 m!376245))

(declare-fun m!376247 () Bool)

(assert (=> b!249850 m!376247))

(declare-fun m!376249 () Bool)

(assert (=> b!249849 m!376249))

(assert (=> b!249849 m!376249))

(declare-fun m!376251 () Bool)

(assert (=> b!249849 m!376251))

(declare-fun m!376253 () Bool)

(assert (=> b!249852 m!376253))

(declare-fun m!376255 () Bool)

(assert (=> b!249852 m!376255))

(push 1)

(assert (not b!249845))

(assert (not b!249853))

(assert (not b!249850))

(assert (not b!249849))

(assert (not b!249851))

(assert (not b!249852))

(assert (not start!53716))

(assert (not b!249847))

(assert (not b!249848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

