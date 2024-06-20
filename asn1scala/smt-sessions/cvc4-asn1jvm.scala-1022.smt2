; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29312 () Bool)

(assert start!29312)

(declare-fun b!151903 () Bool)

(declare-fun e!101515 () Bool)

(declare-datatypes ((array!6771 0))(
  ( (array!6772 (arr!3880 (Array (_ BitVec 32) (_ BitVec 8))) (size!3063 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5384 0))(
  ( (BitStream!5385 (buf!3560 array!6771) (currentByte!6492 (_ BitVec 32)) (currentBit!6487 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5384)

(declare-fun array_inv!2852 (array!6771) Bool)

(assert (=> b!151903 (= e!101515 (array_inv!2852 (buf!3560 thiss!1634)))))

(declare-fun b!151904 () Bool)

(declare-fun res!127378 () Bool)

(declare-fun e!101516 () Bool)

(assert (=> b!151904 (=> (not res!127378) (not e!101516))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151904 (= res!127378 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3063 (buf!3560 thiss!1634))) ((_ sign_extend 32) (currentByte!6492 thiss!1634)) ((_ sign_extend 32) (currentBit!6487 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!127379 () Bool)

(assert (=> start!29312 (=> (not res!127379) (not e!101516))))

(declare-fun arr!237 () array!6771)

(assert (=> start!29312 (= res!127379 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3063 arr!237))))))

(assert (=> start!29312 e!101516))

(assert (=> start!29312 true))

(assert (=> start!29312 (array_inv!2852 arr!237)))

(declare-fun inv!12 (BitStream!5384) Bool)

(assert (=> start!29312 (and (inv!12 thiss!1634) e!101515)))

(declare-fun b!151905 () Bool)

(declare-fun e!101517 () Bool)

(assert (=> b!151905 (= e!101516 (not e!101517))))

(declare-fun res!127380 () Bool)

(assert (=> b!151905 (=> res!127380 e!101517)))

(declare-fun lt!237945 () (_ BitVec 64))

(assert (=> b!151905 (= res!127380 (not (= lt!237945 (bvadd lt!237945 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151905 (= lt!237945 (bitIndex!0 (size!3063 (buf!3560 thiss!1634)) (currentByte!6492 thiss!1634) (currentBit!6487 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5384 BitStream!5384) Bool)

(assert (=> b!151905 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9638 0))(
  ( (Unit!9639) )
))
(declare-fun lt!237946 () Unit!9638)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5384) Unit!9638)

(assert (=> b!151905 (= lt!237946 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151906 () Bool)

(declare-fun res!127377 () Bool)

(assert (=> b!151906 (=> (not res!127377) (not e!101516))))

(assert (=> b!151906 (= res!127377 (bvsge from!447 to!404))))

(declare-fun b!151907 () Bool)

(assert (=> b!151907 (= e!101517 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!13520 0))(
  ( (tuple2!13521 (_1!7135 BitStream!5384) (_2!7135 BitStream!5384)) )
))
(declare-fun lt!237944 () tuple2!13520)

(declare-fun reader!0 (BitStream!5384 BitStream!5384) tuple2!13520)

(assert (=> b!151907 (= lt!237944 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!29312 res!127379) b!151904))

(assert (= (and b!151904 res!127378) b!151906))

(assert (= (and b!151906 res!127377) b!151905))

(assert (= (and b!151905 (not res!127380)) b!151907))

(assert (= start!29312 b!151903))

(declare-fun m!237615 () Bool)

(assert (=> b!151905 m!237615))

(declare-fun m!237617 () Bool)

(assert (=> b!151905 m!237617))

(declare-fun m!237619 () Bool)

(assert (=> b!151905 m!237619))

(declare-fun m!237621 () Bool)

(assert (=> b!151907 m!237621))

(declare-fun m!237623 () Bool)

(assert (=> b!151904 m!237623))

(declare-fun m!237625 () Bool)

(assert (=> start!29312 m!237625))

(declare-fun m!237627 () Bool)

(assert (=> start!29312 m!237627))

(declare-fun m!237629 () Bool)

(assert (=> b!151903 m!237629))

(push 1)

(assert (not b!151904))

(assert (not start!29312))

(assert (not b!151905))

(assert (not b!151903))

(assert (not b!151907))

(check-sat)

(pop 1)

(push 1)

(check-sat)

