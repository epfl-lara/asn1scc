; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27448 () Bool)

(assert start!27448)

(declare-fun b!141037 () Bool)

(declare-fun res!117616 () Bool)

(declare-fun e!93958 () Bool)

(assert (=> b!141037 (=> (not res!117616) (not e!93958))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6463 0))(
  ( (array!6464 (arr!3632 (Array (_ BitVec 32) (_ BitVec 8))) (size!2925 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5108 0))(
  ( (BitStream!5109 (buf!3346 array!6463) (currentByte!6206 (_ BitVec 32)) (currentBit!6201 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5108)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141037 (= res!117616 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2925 (buf!3346 thiss!1634))) ((_ sign_extend 32) (currentByte!6206 thiss!1634)) ((_ sign_extend 32) (currentBit!6201 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141038 () Bool)

(declare-fun res!117613 () Bool)

(declare-fun e!93956 () Bool)

(assert (=> b!141038 (=> (not res!117613) (not e!93956))))

(declare-datatypes ((Unit!8832 0))(
  ( (Unit!8833) )
))
(declare-datatypes ((tuple2!12430 0))(
  ( (tuple2!12431 (_1!6545 Unit!8832) (_2!6545 BitStream!5108)) )
))
(declare-fun lt!219255 () tuple2!12430)

(declare-fun isPrefixOf!0 (BitStream!5108 BitStream!5108) Bool)

(assert (=> b!141038 (= res!117613 (isPrefixOf!0 thiss!1634 (_2!6545 lt!219255)))))

(declare-fun b!141039 () Bool)

(declare-fun arr!237 () array!6463)

(declare-datatypes ((tuple2!12432 0))(
  ( (tuple2!12433 (_1!6546 BitStream!5108) (_2!6546 BitStream!5108)) )
))
(declare-fun lt!219257 () tuple2!12432)

(declare-datatypes ((tuple2!12434 0))(
  ( (tuple2!12435 (_1!6547 BitStream!5108) (_2!6547 (_ BitVec 8))) )
))
(declare-fun lt!219254 () tuple2!12434)

(assert (=> b!141039 (= e!93956 (and (= (_2!6547 lt!219254) (select (arr!3632 arr!237) from!447)) (= (_1!6547 lt!219254) (_2!6546 lt!219257))))))

(declare-fun readBytePure!0 (BitStream!5108) tuple2!12434)

(assert (=> b!141039 (= lt!219254 (readBytePure!0 (_1!6546 lt!219257)))))

(declare-fun reader!0 (BitStream!5108 BitStream!5108) tuple2!12432)

(assert (=> b!141039 (= lt!219257 (reader!0 thiss!1634 (_2!6545 lt!219255)))))

(declare-fun res!117618 () Bool)

(assert (=> start!27448 (=> (not res!117618) (not e!93958))))

(assert (=> start!27448 (= res!117618 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2925 arr!237))))))

(assert (=> start!27448 e!93958))

(assert (=> start!27448 true))

(declare-fun array_inv!2714 (array!6463) Bool)

(assert (=> start!27448 (array_inv!2714 arr!237)))

(declare-fun e!93960 () Bool)

(declare-fun inv!12 (BitStream!5108) Bool)

(assert (=> start!27448 (and (inv!12 thiss!1634) e!93960)))

(declare-fun b!141040 () Bool)

(assert (=> b!141040 (= e!93960 (array_inv!2714 (buf!3346 thiss!1634)))))

(declare-fun b!141041 () Bool)

(declare-fun res!117614 () Bool)

(assert (=> b!141041 (=> (not res!117614) (not e!93956))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141041 (= res!117614 (= (bitIndex!0 (size!2925 (buf!3346 (_2!6545 lt!219255))) (currentByte!6206 (_2!6545 lt!219255)) (currentBit!6201 (_2!6545 lt!219255))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2925 (buf!3346 thiss!1634)) (currentByte!6206 thiss!1634) (currentBit!6201 thiss!1634)))))))

(declare-fun b!141042 () Bool)

(declare-fun res!117617 () Bool)

(assert (=> b!141042 (=> (not res!117617) (not e!93958))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141042 (= res!117617 (invariant!0 (currentBit!6201 thiss!1634) (currentByte!6206 thiss!1634) (size!2925 (buf!3346 thiss!1634))))))

(declare-fun b!141043 () Bool)

(declare-fun res!117619 () Bool)

(assert (=> b!141043 (=> (not res!117619) (not e!93958))))

(assert (=> b!141043 (= res!117619 (bvslt from!447 to!404))))

(declare-fun b!141044 () Bool)

(assert (=> b!141044 (= e!93958 (not (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!141044 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2925 (buf!3346 (_2!6545 lt!219255)))) ((_ sign_extend 32) (currentByte!6206 (_2!6545 lt!219255))) ((_ sign_extend 32) (currentBit!6201 (_2!6545 lt!219255))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219256 () Unit!8832)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5108 BitStream!5108 (_ BitVec 64) (_ BitVec 32)) Unit!8832)

(assert (=> b!141044 (= lt!219256 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6545 lt!219255) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141044 e!93956))

(declare-fun res!117615 () Bool)

(assert (=> b!141044 (=> (not res!117615) (not e!93956))))

(assert (=> b!141044 (= res!117615 (= (size!2925 (buf!3346 thiss!1634)) (size!2925 (buf!3346 (_2!6545 lt!219255)))))))

(declare-fun appendByte!0 (BitStream!5108 (_ BitVec 8)) tuple2!12430)

(assert (=> b!141044 (= lt!219255 (appendByte!0 thiss!1634 (select (arr!3632 arr!237) from!447)))))

(assert (= (and start!27448 res!117618) b!141037))

(assert (= (and b!141037 res!117616) b!141043))

(assert (= (and b!141043 res!117619) b!141042))

(assert (= (and b!141042 res!117617) b!141044))

(assert (= (and b!141044 res!117615) b!141041))

(assert (= (and b!141041 res!117614) b!141038))

(assert (= (and b!141038 res!117613) b!141039))

(assert (= start!27448 b!141040))

(declare-fun m!216865 () Bool)

(assert (=> b!141038 m!216865))

(declare-fun m!216867 () Bool)

(assert (=> b!141042 m!216867))

(declare-fun m!216869 () Bool)

(assert (=> b!141041 m!216869))

(declare-fun m!216871 () Bool)

(assert (=> b!141041 m!216871))

(declare-fun m!216873 () Bool)

(assert (=> b!141040 m!216873))

(declare-fun m!216875 () Bool)

(assert (=> start!27448 m!216875))

(declare-fun m!216877 () Bool)

(assert (=> start!27448 m!216877))

(declare-fun m!216879 () Bool)

(assert (=> b!141044 m!216879))

(declare-fun m!216881 () Bool)

(assert (=> b!141044 m!216881))

(declare-fun m!216883 () Bool)

(assert (=> b!141044 m!216883))

(assert (=> b!141044 m!216883))

(declare-fun m!216885 () Bool)

(assert (=> b!141044 m!216885))

(assert (=> b!141039 m!216883))

(declare-fun m!216887 () Bool)

(assert (=> b!141039 m!216887))

(declare-fun m!216889 () Bool)

(assert (=> b!141039 m!216889))

(declare-fun m!216891 () Bool)

(assert (=> b!141037 m!216891))

(push 1)

(assert (not b!141040))

(assert (not b!141044))

(assert (not b!141042))

(assert (not b!141038))

(assert (not b!141041))

(assert (not b!141037))

(assert (not start!27448))

(assert (not b!141039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

