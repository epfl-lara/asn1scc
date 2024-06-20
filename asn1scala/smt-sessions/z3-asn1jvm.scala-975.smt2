; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27440 () Bool)

(assert start!27440)

(declare-fun b!140941 () Bool)

(declare-fun res!117535 () Bool)

(declare-fun e!93899 () Bool)

(assert (=> b!140941 (=> (not res!117535) (not e!93899))))

(declare-datatypes ((array!6455 0))(
  ( (array!6456 (arr!3628 (Array (_ BitVec 32) (_ BitVec 8))) (size!2921 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5100 0))(
  ( (BitStream!5101 (buf!3342 array!6455) (currentByte!6202 (_ BitVec 32)) (currentBit!6197 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5100)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140941 (= res!117535 (invariant!0 (currentBit!6197 thiss!1634) (currentByte!6202 thiss!1634) (size!2921 (buf!3342 thiss!1634))))))

(declare-fun b!140942 () Bool)

(declare-fun res!117530 () Bool)

(assert (=> b!140942 (=> (not res!117530) (not e!93899))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140942 (= res!117530 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2921 (buf!3342 thiss!1634))) ((_ sign_extend 32) (currentByte!6202 thiss!1634)) ((_ sign_extend 32) (currentBit!6197 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun e!93898 () Bool)

(declare-fun arr!237 () array!6455)

(declare-datatypes ((tuple2!12406 0))(
  ( (tuple2!12407 (_1!6533 BitStream!5100) (_2!6533 (_ BitVec 8))) )
))
(declare-fun lt!219207 () tuple2!12406)

(declare-fun b!140943 () Bool)

(declare-datatypes ((tuple2!12408 0))(
  ( (tuple2!12409 (_1!6534 BitStream!5100) (_2!6534 BitStream!5100)) )
))
(declare-fun lt!219209 () tuple2!12408)

(assert (=> b!140943 (= e!93898 (and (= (_2!6533 lt!219207) (select (arr!3628 arr!237) from!447)) (= (_1!6533 lt!219207) (_2!6534 lt!219209))))))

(declare-fun readBytePure!0 (BitStream!5100) tuple2!12406)

(assert (=> b!140943 (= lt!219207 (readBytePure!0 (_1!6534 lt!219209)))))

(declare-datatypes ((Unit!8824 0))(
  ( (Unit!8825) )
))
(declare-datatypes ((tuple2!12410 0))(
  ( (tuple2!12411 (_1!6535 Unit!8824) (_2!6535 BitStream!5100)) )
))
(declare-fun lt!219206 () tuple2!12410)

(declare-fun reader!0 (BitStream!5100 BitStream!5100) tuple2!12408)

(assert (=> b!140943 (= lt!219209 (reader!0 thiss!1634 (_2!6535 lt!219206)))))

(declare-fun b!140944 () Bool)

(declare-fun res!117531 () Bool)

(assert (=> b!140944 (=> (not res!117531) (not e!93899))))

(assert (=> b!140944 (= res!117531 (bvslt from!447 to!404))))

(declare-fun b!140945 () Bool)

(assert (=> b!140945 (= e!93899 (not (or (not (= (bvand from!447 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand from!447 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)))))))

(assert (=> b!140945 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2921 (buf!3342 (_2!6535 lt!219206)))) ((_ sign_extend 32) (currentByte!6202 (_2!6535 lt!219206))) ((_ sign_extend 32) (currentBit!6197 (_2!6535 lt!219206))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219208 () Unit!8824)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5100 BitStream!5100 (_ BitVec 64) (_ BitVec 32)) Unit!8824)

(assert (=> b!140945 (= lt!219208 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6535 lt!219206) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!140945 e!93898))

(declare-fun res!117534 () Bool)

(assert (=> b!140945 (=> (not res!117534) (not e!93898))))

(assert (=> b!140945 (= res!117534 (= (size!2921 (buf!3342 thiss!1634)) (size!2921 (buf!3342 (_2!6535 lt!219206)))))))

(declare-fun appendByte!0 (BitStream!5100 (_ BitVec 8)) tuple2!12410)

(assert (=> b!140945 (= lt!219206 (appendByte!0 thiss!1634 (select (arr!3628 arr!237) from!447)))))

(declare-fun b!140946 () Bool)

(declare-fun e!93897 () Bool)

(declare-fun array_inv!2710 (array!6455) Bool)

(assert (=> b!140946 (= e!93897 (array_inv!2710 (buf!3342 thiss!1634)))))

(declare-fun b!140947 () Bool)

(declare-fun res!117529 () Bool)

(assert (=> b!140947 (=> (not res!117529) (not e!93898))))

(declare-fun isPrefixOf!0 (BitStream!5100 BitStream!5100) Bool)

(assert (=> b!140947 (= res!117529 (isPrefixOf!0 thiss!1634 (_2!6535 lt!219206)))))

(declare-fun b!140948 () Bool)

(declare-fun res!117532 () Bool)

(assert (=> b!140948 (=> (not res!117532) (not e!93898))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140948 (= res!117532 (= (bitIndex!0 (size!2921 (buf!3342 (_2!6535 lt!219206))) (currentByte!6202 (_2!6535 lt!219206)) (currentBit!6197 (_2!6535 lt!219206))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2921 (buf!3342 thiss!1634)) (currentByte!6202 thiss!1634) (currentBit!6197 thiss!1634)))))))

(declare-fun res!117533 () Bool)

(assert (=> start!27440 (=> (not res!117533) (not e!93899))))

(assert (=> start!27440 (= res!117533 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2921 arr!237))))))

(assert (=> start!27440 e!93899))

(assert (=> start!27440 true))

(assert (=> start!27440 (array_inv!2710 arr!237)))

(declare-fun inv!12 (BitStream!5100) Bool)

(assert (=> start!27440 (and (inv!12 thiss!1634) e!93897)))

(assert (= (and start!27440 res!117533) b!140942))

(assert (= (and b!140942 res!117530) b!140944))

(assert (= (and b!140944 res!117531) b!140941))

(assert (= (and b!140941 res!117535) b!140945))

(assert (= (and b!140945 res!117534) b!140948))

(assert (= (and b!140948 res!117532) b!140947))

(assert (= (and b!140947 res!117529) b!140943))

(assert (= start!27440 b!140946))

(declare-fun m!216753 () Bool)

(assert (=> b!140946 m!216753))

(declare-fun m!216755 () Bool)

(assert (=> b!140942 m!216755))

(declare-fun m!216757 () Bool)

(assert (=> b!140947 m!216757))

(declare-fun m!216759 () Bool)

(assert (=> start!27440 m!216759))

(declare-fun m!216761 () Bool)

(assert (=> start!27440 m!216761))

(declare-fun m!216763 () Bool)

(assert (=> b!140941 m!216763))

(declare-fun m!216765 () Bool)

(assert (=> b!140945 m!216765))

(declare-fun m!216767 () Bool)

(assert (=> b!140945 m!216767))

(declare-fun m!216769 () Bool)

(assert (=> b!140945 m!216769))

(assert (=> b!140945 m!216769))

(declare-fun m!216771 () Bool)

(assert (=> b!140945 m!216771))

(declare-fun m!216773 () Bool)

(assert (=> b!140948 m!216773))

(declare-fun m!216775 () Bool)

(assert (=> b!140948 m!216775))

(assert (=> b!140943 m!216769))

(declare-fun m!216777 () Bool)

(assert (=> b!140943 m!216777))

(declare-fun m!216779 () Bool)

(assert (=> b!140943 m!216779))

(check-sat (not b!140948) (not b!140943) (not b!140947) (not b!140946) (not b!140941) (not start!27440) (not b!140945) (not b!140942))
(check-sat)
