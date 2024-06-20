; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27456 () Bool)

(assert start!27456)

(declare-fun b!141147 () Bool)

(declare-fun res!117714 () Bool)

(declare-fun e!94029 () Bool)

(assert (=> b!141147 (=> (not res!117714) (not e!94029))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6471 0))(
  ( (array!6472 (arr!3636 (Array (_ BitVec 32) (_ BitVec 8))) (size!2929 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5116 0))(
  ( (BitStream!5117 (buf!3350 array!6471) (currentByte!6210 (_ BitVec 32)) (currentBit!6205 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5116)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141147 (= res!117714 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2929 (buf!3350 thiss!1634))) ((_ sign_extend 32) (currentByte!6210 thiss!1634)) ((_ sign_extend 32) (currentBit!6205 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141148 () Bool)

(declare-fun e!94033 () Bool)

(assert (=> b!141148 (= e!94029 (not e!94033))))

(declare-fun res!117711 () Bool)

(assert (=> b!141148 (=> res!117711 e!94033)))

(assert (=> b!141148 (= res!117711 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-datatypes ((Unit!8840 0))(
  ( (Unit!8841) )
))
(declare-datatypes ((tuple2!12454 0))(
  ( (tuple2!12455 (_1!6557 Unit!8840) (_2!6557 BitStream!5116)) )
))
(declare-fun lt!219304 () tuple2!12454)

(assert (=> b!141148 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2929 (buf!3350 (_2!6557 lt!219304)))) ((_ sign_extend 32) (currentByte!6210 (_2!6557 lt!219304))) ((_ sign_extend 32) (currentBit!6205 (_2!6557 lt!219304))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219305 () Unit!8840)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5116 BitStream!5116 (_ BitVec 64) (_ BitVec 32)) Unit!8840)

(assert (=> b!141148 (= lt!219305 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6557 lt!219304) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94030 () Bool)

(assert (=> b!141148 e!94030))

(declare-fun res!117710 () Bool)

(assert (=> b!141148 (=> (not res!117710) (not e!94030))))

(assert (=> b!141148 (= res!117710 (= (size!2929 (buf!3350 thiss!1634)) (size!2929 (buf!3350 (_2!6557 lt!219304)))))))

(declare-fun arr!237 () array!6471)

(declare-fun appendByte!0 (BitStream!5116 (_ BitVec 8)) tuple2!12454)

(assert (=> b!141148 (= lt!219304 (appendByte!0 thiss!1634 (select (arr!3636 arr!237) from!447)))))

(declare-fun b!141149 () Bool)

(declare-fun e!94035 () Bool)

(assert (=> b!141149 (= e!94033 e!94035)))

(declare-fun res!117717 () Bool)

(assert (=> b!141149 (=> res!117717 e!94035)))

(declare-fun lt!219306 () (_ BitVec 32))

(assert (=> b!141149 (= res!117717 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2929 (buf!3350 (_2!6557 lt!219304)))) ((_ sign_extend 32) (currentByte!6210 (_2!6557 lt!219304))) ((_ sign_extend 32) (currentBit!6205 (_2!6557 lt!219304))) lt!219306)))))

(assert (=> b!141149 (= lt!219306 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!141150 () Bool)

(declare-fun res!117712 () Bool)

(assert (=> b!141150 (=> (not res!117712) (not e!94029))))

(assert (=> b!141150 (= res!117712 (bvslt from!447 to!404))))

(declare-fun b!141151 () Bool)

(declare-fun res!117715 () Bool)

(assert (=> b!141151 (=> (not res!117715) (not e!94030))))

(declare-fun isPrefixOf!0 (BitStream!5116 BitStream!5116) Bool)

(assert (=> b!141151 (= res!117715 (isPrefixOf!0 thiss!1634 (_2!6557 lt!219304)))))

(declare-fun b!141152 () Bool)

(declare-fun e!94034 () Bool)

(declare-fun array_inv!2718 (array!6471) Bool)

(assert (=> b!141152 (= e!94034 (array_inv!2718 (buf!3350 thiss!1634)))))

(declare-fun b!141153 () Bool)

(assert (=> b!141153 (= e!94035 (bvslt lt!219306 (bvsub to!404 from!447)))))

(declare-fun b!141146 () Bool)

(declare-datatypes ((tuple2!12456 0))(
  ( (tuple2!12457 (_1!6558 BitStream!5116) (_2!6558 BitStream!5116)) )
))
(declare-fun lt!219308 () tuple2!12456)

(declare-datatypes ((tuple2!12458 0))(
  ( (tuple2!12459 (_1!6559 BitStream!5116) (_2!6559 (_ BitVec 8))) )
))
(declare-fun lt!219307 () tuple2!12458)

(assert (=> b!141146 (= e!94030 (and (= (_2!6559 lt!219307) (select (arr!3636 arr!237) from!447)) (= (_1!6559 lt!219307) (_2!6558 lt!219308))))))

(declare-fun readBytePure!0 (BitStream!5116) tuple2!12458)

(assert (=> b!141146 (= lt!219307 (readBytePure!0 (_1!6558 lt!219308)))))

(declare-fun reader!0 (BitStream!5116 BitStream!5116) tuple2!12456)

(assert (=> b!141146 (= lt!219308 (reader!0 thiss!1634 (_2!6557 lt!219304)))))

(declare-fun res!117718 () Bool)

(assert (=> start!27456 (=> (not res!117718) (not e!94029))))

(assert (=> start!27456 (= res!117718 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2929 arr!237))))))

(assert (=> start!27456 e!94029))

(assert (=> start!27456 true))

(assert (=> start!27456 (array_inv!2718 arr!237)))

(declare-fun inv!12 (BitStream!5116) Bool)

(assert (=> start!27456 (and (inv!12 thiss!1634) e!94034)))

(declare-fun b!141154 () Bool)

(declare-fun res!117713 () Bool)

(assert (=> b!141154 (=> (not res!117713) (not e!94030))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141154 (= res!117713 (= (bitIndex!0 (size!2929 (buf!3350 (_2!6557 lt!219304))) (currentByte!6210 (_2!6557 lt!219304)) (currentBit!6205 (_2!6557 lt!219304))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2929 (buf!3350 thiss!1634)) (currentByte!6210 thiss!1634) (currentBit!6205 thiss!1634)))))))

(declare-fun b!141155 () Bool)

(declare-fun res!117716 () Bool)

(assert (=> b!141155 (=> (not res!117716) (not e!94029))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141155 (= res!117716 (invariant!0 (currentBit!6205 thiss!1634) (currentByte!6210 thiss!1634) (size!2929 (buf!3350 thiss!1634))))))

(assert (= (and start!27456 res!117718) b!141147))

(assert (= (and b!141147 res!117714) b!141150))

(assert (= (and b!141150 res!117712) b!141155))

(assert (= (and b!141155 res!117716) b!141148))

(assert (= (and b!141148 res!117710) b!141154))

(assert (= (and b!141154 res!117713) b!141151))

(assert (= (and b!141151 res!117715) b!141146))

(assert (= (and b!141148 (not res!117711)) b!141149))

(assert (= (and b!141149 (not res!117717)) b!141153))

(assert (= start!27456 b!141152))

(declare-fun m!216983 () Bool)

(assert (=> b!141146 m!216983))

(declare-fun m!216985 () Bool)

(assert (=> b!141146 m!216985))

(declare-fun m!216987 () Bool)

(assert (=> b!141146 m!216987))

(declare-fun m!216989 () Bool)

(assert (=> b!141147 m!216989))

(declare-fun m!216991 () Bool)

(assert (=> b!141151 m!216991))

(declare-fun m!216993 () Bool)

(assert (=> start!27456 m!216993))

(declare-fun m!216995 () Bool)

(assert (=> start!27456 m!216995))

(declare-fun m!216997 () Bool)

(assert (=> b!141149 m!216997))

(declare-fun m!216999 () Bool)

(assert (=> b!141154 m!216999))

(declare-fun m!217001 () Bool)

(assert (=> b!141154 m!217001))

(declare-fun m!217003 () Bool)

(assert (=> b!141148 m!217003))

(declare-fun m!217005 () Bool)

(assert (=> b!141148 m!217005))

(assert (=> b!141148 m!216983))

(assert (=> b!141148 m!216983))

(declare-fun m!217007 () Bool)

(assert (=> b!141148 m!217007))

(declare-fun m!217009 () Bool)

(assert (=> b!141152 m!217009))

(declare-fun m!217011 () Bool)

(assert (=> b!141155 m!217011))

(push 1)

(assert (not b!141151))

(assert (not b!141152))

(assert (not b!141147))

(assert (not b!141149))

(assert (not b!141155))

(assert (not b!141148))

(assert (not start!27456))

(assert (not b!141146))

(assert (not b!141154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

