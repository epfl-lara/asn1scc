; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8376 () Bool)

(assert start!8376)

(declare-fun b!41867 () Bool)

(declare-fun e!27836 () Bool)

(declare-fun e!27839 () Bool)

(assert (=> b!41867 (= e!27836 (not e!27839))))

(declare-fun res!35613 () Bool)

(assert (=> b!41867 (=> res!35613 e!27839)))

(declare-fun lt!63102 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!41867 (= res!35613 (or (bvslt i!635 to!314) (not (= lt!63102 (bvsub (bvadd lt!63102 to!314) i!635)))))))

(declare-datatypes ((array!2128 0))(
  ( (array!2129 (arr!1461 (Array (_ BitVec 32) (_ BitVec 8))) (size!962 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1668 0))(
  ( (BitStream!1669 (buf!1290 array!2128) (currentByte!2742 (_ BitVec 32)) (currentBit!2737 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1668)

(declare-fun isPrefixOf!0 (BitStream!1668 BitStream!1668) Bool)

(assert (=> b!41867 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2975 0))(
  ( (Unit!2976) )
))
(declare-fun lt!63103 () Unit!2975)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1668) Unit!2975)

(assert (=> b!41867 (= lt!63103 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41867 (= lt!63102 (bitIndex!0 (size!962 (buf!1290 thiss!1379)) (currentByte!2742 thiss!1379) (currentBit!2737 thiss!1379)))))

(declare-fun b!41868 () Bool)

(declare-fun res!35609 () Bool)

(assert (=> b!41868 (=> (not res!35609) (not e!27836))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41868 (= res!35609 (validate_offset_bits!1 ((_ sign_extend 32) (size!962 (buf!1290 thiss!1379))) ((_ sign_extend 32) (currentByte!2742 thiss!1379)) ((_ sign_extend 32) (currentBit!2737 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41869 () Bool)

(declare-fun e!27838 () Bool)

(declare-fun array_inv!887 (array!2128) Bool)

(assert (=> b!41869 (= e!27838 (array_inv!887 (buf!1290 thiss!1379)))))

(declare-fun res!35610 () Bool)

(assert (=> start!8376 (=> (not res!35610) (not e!27836))))

(declare-fun srcBuffer!2 () array!2128)

(assert (=> start!8376 (= res!35610 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!962 srcBuffer!2))))))))

(assert (=> start!8376 e!27836))

(assert (=> start!8376 true))

(assert (=> start!8376 (array_inv!887 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1668) Bool)

(assert (=> start!8376 (and (inv!12 thiss!1379) e!27838)))

(declare-fun b!41870 () Bool)

(declare-fun e!27840 () Bool)

(assert (=> b!41870 (= e!27840 true)))

(declare-datatypes ((tuple2!4070 0))(
  ( (tuple2!4071 (_1!2125 array!2128) (_2!2125 BitStream!1668)) )
))
(declare-fun lt!63101 () tuple2!4070)

(declare-fun checkByteArrayBitContent!0 (BitStream!1668 array!2128 array!2128 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41870 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2125 lt!63101) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41871 () Bool)

(declare-fun res!35611 () Bool)

(assert (=> b!41871 (=> res!35611 e!27839)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41871 (= res!35611 (not (invariant!0 (currentBit!2737 thiss!1379) (currentByte!2742 thiss!1379) (size!962 (buf!1290 thiss!1379)))))))

(declare-fun b!41872 () Bool)

(assert (=> b!41872 (= e!27839 e!27840)))

(declare-fun res!35612 () Bool)

(assert (=> b!41872 (=> res!35612 e!27840)))

(assert (=> b!41872 (= res!35612 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1668 (_ BitVec 64)) tuple2!4070)

(declare-datatypes ((tuple2!4072 0))(
  ( (tuple2!4073 (_1!2126 BitStream!1668) (_2!2126 BitStream!1668)) )
))
(declare-fun reader!0 (BitStream!1668 BitStream!1668) tuple2!4072)

(assert (=> b!41872 (= lt!63101 (readBits!0 (_1!2126 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8376 res!35610) b!41868))

(assert (= (and b!41868 res!35609) b!41867))

(assert (= (and b!41867 (not res!35613)) b!41871))

(assert (= (and b!41871 (not res!35611)) b!41872))

(assert (= (and b!41872 (not res!35612)) b!41870))

(assert (= start!8376 b!41869))

(declare-fun m!63647 () Bool)

(assert (=> b!41871 m!63647))

(declare-fun m!63649 () Bool)

(assert (=> b!41867 m!63649))

(declare-fun m!63651 () Bool)

(assert (=> b!41867 m!63651))

(declare-fun m!63653 () Bool)

(assert (=> b!41867 m!63653))

(declare-fun m!63655 () Bool)

(assert (=> b!41872 m!63655))

(declare-fun m!63657 () Bool)

(assert (=> b!41872 m!63657))

(declare-fun m!63659 () Bool)

(assert (=> start!8376 m!63659))

(declare-fun m!63661 () Bool)

(assert (=> start!8376 m!63661))

(declare-fun m!63663 () Bool)

(assert (=> b!41869 m!63663))

(declare-fun m!63665 () Bool)

(assert (=> b!41868 m!63665))

(declare-fun m!63667 () Bool)

(assert (=> b!41870 m!63667))

(check-sat (not b!41867) (not b!41868) (not b!41872) (not b!41870) (not b!41869) (not b!41871) (not start!8376))
