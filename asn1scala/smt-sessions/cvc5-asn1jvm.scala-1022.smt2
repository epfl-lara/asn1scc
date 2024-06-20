; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29308 () Bool)

(assert start!29308)

(declare-fun b!151873 () Bool)

(declare-fun e!101486 () Bool)

(declare-fun e!101483 () Bool)

(assert (=> b!151873 (= e!101486 (not e!101483))))

(declare-fun res!127355 () Bool)

(assert (=> b!151873 (=> res!127355 e!101483)))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun lt!237927 () (_ BitVec 64))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!151873 (= res!127355 (not (= lt!237927 (bvadd lt!237927 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-datatypes ((array!6767 0))(
  ( (array!6768 (arr!3878 (Array (_ BitVec 32) (_ BitVec 8))) (size!3061 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5380 0))(
  ( (BitStream!5381 (buf!3558 array!6767) (currentByte!6490 (_ BitVec 32)) (currentBit!6485 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5380)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151873 (= lt!237927 (bitIndex!0 (size!3061 (buf!3558 thiss!1634)) (currentByte!6490 thiss!1634) (currentBit!6485 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5380 BitStream!5380) Bool)

(assert (=> b!151873 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9634 0))(
  ( (Unit!9635) )
))
(declare-fun lt!237926 () Unit!9634)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5380) Unit!9634)

(assert (=> b!151873 (= lt!237926 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151874 () Bool)

(declare-fun res!127356 () Bool)

(assert (=> b!151874 (=> (not res!127356) (not e!101486))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151874 (= res!127356 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3061 (buf!3558 thiss!1634))) ((_ sign_extend 32) (currentByte!6490 thiss!1634)) ((_ sign_extend 32) (currentBit!6485 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!127353 () Bool)

(assert (=> start!29308 (=> (not res!127353) (not e!101486))))

(declare-fun arr!237 () array!6767)

(assert (=> start!29308 (= res!127353 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3061 arr!237))))))

(assert (=> start!29308 e!101486))

(assert (=> start!29308 true))

(declare-fun array_inv!2850 (array!6767) Bool)

(assert (=> start!29308 (array_inv!2850 arr!237)))

(declare-fun e!101484 () Bool)

(declare-fun inv!12 (BitStream!5380) Bool)

(assert (=> start!29308 (and (inv!12 thiss!1634) e!101484)))

(declare-fun b!151875 () Bool)

(assert (=> b!151875 (= e!101483 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!13516 0))(
  ( (tuple2!13517 (_1!7133 BitStream!5380) (_2!7133 BitStream!5380)) )
))
(declare-fun lt!237928 () tuple2!13516)

(declare-fun reader!0 (BitStream!5380 BitStream!5380) tuple2!13516)

(assert (=> b!151875 (= lt!237928 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!151876 () Bool)

(assert (=> b!151876 (= e!101484 (array_inv!2850 (buf!3558 thiss!1634)))))

(declare-fun b!151877 () Bool)

(declare-fun res!127354 () Bool)

(assert (=> b!151877 (=> (not res!127354) (not e!101486))))

(assert (=> b!151877 (= res!127354 (bvsge from!447 to!404))))

(assert (= (and start!29308 res!127353) b!151874))

(assert (= (and b!151874 res!127356) b!151877))

(assert (= (and b!151877 res!127354) b!151873))

(assert (= (and b!151873 (not res!127355)) b!151875))

(assert (= start!29308 b!151876))

(declare-fun m!237583 () Bool)

(assert (=> start!29308 m!237583))

(declare-fun m!237585 () Bool)

(assert (=> start!29308 m!237585))

(declare-fun m!237587 () Bool)

(assert (=> b!151875 m!237587))

(declare-fun m!237589 () Bool)

(assert (=> b!151874 m!237589))

(declare-fun m!237591 () Bool)

(assert (=> b!151876 m!237591))

(declare-fun m!237593 () Bool)

(assert (=> b!151873 m!237593))

(declare-fun m!237595 () Bool)

(assert (=> b!151873 m!237595))

(declare-fun m!237597 () Bool)

(assert (=> b!151873 m!237597))

(push 1)

(assert (not b!151875))

(assert (not b!151873))

(assert (not b!151876))

(assert (not b!151874))

(assert (not start!29308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

