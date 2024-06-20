; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27436 () Bool)

(assert start!27436)

(declare-fun b!140892 () Bool)

(declare-fun res!117490 () Bool)

(declare-fun e!93867 () Bool)

(assert (=> b!140892 (=> (not res!117490) (not e!93867))))

(declare-datatypes ((array!6451 0))(
  ( (array!6452 (arr!3626 (Array (_ BitVec 32) (_ BitVec 8))) (size!2919 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5096 0))(
  ( (BitStream!5097 (buf!3340 array!6451) (currentByte!6200 (_ BitVec 32)) (currentBit!6195 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8820 0))(
  ( (Unit!8821) )
))
(declare-datatypes ((tuple2!12394 0))(
  ( (tuple2!12395 (_1!6527 Unit!8820) (_2!6527 BitStream!5096)) )
))
(declare-fun lt!219184 () tuple2!12394)

(declare-fun thiss!1634 () BitStream!5096)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140892 (= res!117490 (= (bitIndex!0 (size!2919 (buf!3340 (_2!6527 lt!219184))) (currentByte!6200 (_2!6527 lt!219184)) (currentBit!6195 (_2!6527 lt!219184))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2919 (buf!3340 thiss!1634)) (currentByte!6200 thiss!1634) (currentBit!6195 thiss!1634)))))))

(declare-fun b!140893 () Bool)

(declare-fun res!117487 () Bool)

(declare-fun e!93870 () Bool)

(assert (=> b!140893 (=> (not res!117487) (not e!93870))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140893 (= res!117487 (bvslt from!447 to!404))))

(declare-fun b!140894 () Bool)

(declare-datatypes ((tuple2!12396 0))(
  ( (tuple2!12397 (_1!6528 BitStream!5096) (_2!6528 BitStream!5096)) )
))
(declare-fun lt!219182 () tuple2!12396)

(declare-datatypes ((tuple2!12398 0))(
  ( (tuple2!12399 (_1!6529 BitStream!5096) (_2!6529 (_ BitVec 8))) )
))
(declare-fun lt!219183 () tuple2!12398)

(declare-fun arr!237 () array!6451)

(assert (=> b!140894 (= e!93867 (and (= (_2!6529 lt!219183) (select (arr!3626 arr!237) from!447)) (= (_1!6529 lt!219183) (_2!6528 lt!219182))))))

(declare-fun readBytePure!0 (BitStream!5096) tuple2!12398)

(assert (=> b!140894 (= lt!219183 (readBytePure!0 (_1!6528 lt!219182)))))

(declare-fun reader!0 (BitStream!5096 BitStream!5096) tuple2!12396)

(assert (=> b!140894 (= lt!219182 (reader!0 thiss!1634 (_2!6527 lt!219184)))))

(declare-fun b!140895 () Bool)

(declare-fun res!117486 () Bool)

(assert (=> b!140895 (=> (not res!117486) (not e!93870))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140895 (= res!117486 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2919 (buf!3340 thiss!1634))) ((_ sign_extend 32) (currentByte!6200 thiss!1634)) ((_ sign_extend 32) (currentBit!6195 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140896 () Bool)

(declare-fun e!93865 () Bool)

(assert (=> b!140896 (= e!93865 true)))

(declare-fun lt!219185 () (_ BitVec 64))

(assert (=> b!140896 (= lt!219185 (bitIndex!0 (size!2919 (buf!3340 thiss!1634)) (currentByte!6200 thiss!1634) (currentBit!6195 thiss!1634)))))

(declare-fun b!140897 () Bool)

(declare-fun res!117492 () Bool)

(assert (=> b!140897 (=> (not res!117492) (not e!93870))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140897 (= res!117492 (invariant!0 (currentBit!6195 thiss!1634) (currentByte!6200 thiss!1634) (size!2919 (buf!3340 thiss!1634))))))

(declare-fun b!140898 () Bool)

(assert (=> b!140898 (= e!93870 (not e!93865))))

(declare-fun res!117491 () Bool)

(assert (=> b!140898 (=> res!117491 e!93865)))

(assert (=> b!140898 (= res!117491 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2919 (buf!3340 (_2!6527 lt!219184))) (currentByte!6200 (_2!6527 lt!219184)) (currentBit!6195 (_2!6527 lt!219184)))))))

(assert (=> b!140898 e!93867))

(declare-fun res!117489 () Bool)

(assert (=> b!140898 (=> (not res!117489) (not e!93867))))

(assert (=> b!140898 (= res!117489 (= (size!2919 (buf!3340 thiss!1634)) (size!2919 (buf!3340 (_2!6527 lt!219184)))))))

(declare-fun appendByte!0 (BitStream!5096 (_ BitVec 8)) tuple2!12394)

(assert (=> b!140898 (= lt!219184 (appendByte!0 thiss!1634 (select (arr!3626 arr!237) from!447)))))

(declare-fun b!140899 () Bool)

(declare-fun e!93869 () Bool)

(declare-fun array_inv!2708 (array!6451) Bool)

(assert (=> b!140899 (= e!93869 (array_inv!2708 (buf!3340 thiss!1634)))))

(declare-fun b!140900 () Bool)

(declare-fun res!117493 () Bool)

(assert (=> b!140900 (=> (not res!117493) (not e!93867))))

(declare-fun isPrefixOf!0 (BitStream!5096 BitStream!5096) Bool)

(assert (=> b!140900 (= res!117493 (isPrefixOf!0 thiss!1634 (_2!6527 lt!219184)))))

(declare-fun res!117488 () Bool)

(assert (=> start!27436 (=> (not res!117488) (not e!93870))))

(assert (=> start!27436 (= res!117488 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2919 arr!237))))))

(assert (=> start!27436 e!93870))

(assert (=> start!27436 true))

(assert (=> start!27436 (array_inv!2708 arr!237)))

(declare-fun inv!12 (BitStream!5096) Bool)

(assert (=> start!27436 (and (inv!12 thiss!1634) e!93869)))

(assert (= (and start!27436 res!117488) b!140895))

(assert (= (and b!140895 res!117486) b!140893))

(assert (= (and b!140893 res!117487) b!140897))

(assert (= (and b!140897 res!117492) b!140898))

(assert (= (and b!140898 res!117489) b!140892))

(assert (= (and b!140892 res!117490) b!140900))

(assert (= (and b!140900 res!117493) b!140894))

(assert (= (and b!140898 (not res!117491)) b!140896))

(assert (= start!27436 b!140899))

(declare-fun m!216701 () Bool)

(assert (=> b!140898 m!216701))

(declare-fun m!216703 () Bool)

(assert (=> b!140898 m!216703))

(assert (=> b!140898 m!216703))

(declare-fun m!216705 () Bool)

(assert (=> b!140898 m!216705))

(declare-fun m!216707 () Bool)

(assert (=> b!140896 m!216707))

(declare-fun m!216709 () Bool)

(assert (=> b!140897 m!216709))

(declare-fun m!216711 () Bool)

(assert (=> b!140899 m!216711))

(declare-fun m!216713 () Bool)

(assert (=> b!140895 m!216713))

(assert (=> b!140892 m!216701))

(assert (=> b!140892 m!216707))

(declare-fun m!216715 () Bool)

(assert (=> b!140900 m!216715))

(declare-fun m!216717 () Bool)

(assert (=> start!27436 m!216717))

(declare-fun m!216719 () Bool)

(assert (=> start!27436 m!216719))

(assert (=> b!140894 m!216703))

(declare-fun m!216721 () Bool)

(assert (=> b!140894 m!216721))

(declare-fun m!216723 () Bool)

(assert (=> b!140894 m!216723))

(push 1)

(assert (not b!140892))

(assert (not b!140896))

(assert (not b!140898))

(assert (not b!140895))

(assert (not b!140894))

(assert (not b!140900))

