; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29324 () Bool)

(assert start!29324)

(declare-fun res!127450 () Bool)

(declare-fun e!101603 () Bool)

(assert (=> start!29324 (=> (not res!127450) (not e!101603))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6783 0))(
  ( (array!6784 (arr!3886 (Array (_ BitVec 32) (_ BitVec 8))) (size!3069 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6783)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!29324 (= res!127450 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3069 arr!237))))))

(assert (=> start!29324 e!101603))

(assert (=> start!29324 true))

(declare-fun array_inv!2858 (array!6783) Bool)

(assert (=> start!29324 (array_inv!2858 arr!237)))

(declare-datatypes ((BitStream!5396 0))(
  ( (BitStream!5397 (buf!3566 array!6783) (currentByte!6498 (_ BitVec 32)) (currentBit!6493 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5396)

(declare-fun e!101607 () Bool)

(declare-fun inv!12 (BitStream!5396) Bool)

(assert (=> start!29324 (and (inv!12 thiss!1634) e!101607)))

(declare-fun b!151993 () Bool)

(declare-fun e!101605 () Bool)

(assert (=> b!151993 (= e!101603 (not e!101605))))

(declare-fun res!127452 () Bool)

(assert (=> b!151993 (=> res!127452 e!101605)))

(declare-fun lt!238009 () (_ BitVec 64))

(declare-fun lt!238006 () (_ BitVec 64))

(assert (=> b!151993 (= res!127452 (not (= lt!238009 (bvadd lt!238009 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!238006)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151993 (= lt!238009 (bitIndex!0 (size!3069 (buf!3566 thiss!1634)) (currentByte!6498 thiss!1634) (currentBit!6493 thiss!1634)))))

(assert (=> b!151993 (= lt!238006 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5396 BitStream!5396) Bool)

(assert (=> b!151993 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9650 0))(
  ( (Unit!9651) )
))
(declare-fun lt!238007 () Unit!9650)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5396) Unit!9650)

(assert (=> b!151993 (= lt!238007 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!151994 () Bool)

(declare-fun res!127449 () Bool)

(assert (=> b!151994 (=> (not res!127449) (not e!101603))))

(assert (=> b!151994 (= res!127449 (bvsge from!447 to!404))))

(declare-fun b!151995 () Bool)

(declare-fun res!127451 () Bool)

(assert (=> b!151995 (=> (not res!127451) (not e!101603))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151995 (= res!127451 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3069 (buf!3566 thiss!1634))) ((_ sign_extend 32) (currentByte!6498 thiss!1634)) ((_ sign_extend 32) (currentBit!6493 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!151996 () Bool)

(assert (=> b!151996 (= e!101607 (array_inv!2858 (buf!3566 thiss!1634)))))

(declare-fun b!151997 () Bool)

(assert (=> b!151997 (= e!101605 (bvsge lt!238006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!13532 0))(
  ( (tuple2!13533 (_1!7141 BitStream!5396) (_2!7141 BitStream!5396)) )
))
(declare-fun lt!238008 () tuple2!13532)

(declare-fun reader!0 (BitStream!5396 BitStream!5396) tuple2!13532)

(assert (=> b!151997 (= lt!238008 (reader!0 thiss!1634 thiss!1634))))

(assert (= (and start!29324 res!127450) b!151995))

(assert (= (and b!151995 res!127451) b!151994))

(assert (= (and b!151994 res!127449) b!151993))

(assert (= (and b!151993 (not res!127452)) b!151997))

(assert (= start!29324 b!151996))

(declare-fun m!237711 () Bool)

(assert (=> start!29324 m!237711))

(declare-fun m!237713 () Bool)

(assert (=> start!29324 m!237713))

(declare-fun m!237715 () Bool)

(assert (=> b!151997 m!237715))

(declare-fun m!237717 () Bool)

(assert (=> b!151995 m!237717))

(declare-fun m!237719 () Bool)

(assert (=> b!151993 m!237719))

(declare-fun m!237721 () Bool)

(assert (=> b!151993 m!237721))

(declare-fun m!237723 () Bool)

(assert (=> b!151993 m!237723))

(declare-fun m!237725 () Bool)

(assert (=> b!151996 m!237725))

(push 1)

(assert (not b!151995))

(assert (not b!151996))

(assert (not start!29324))

(assert (not b!151993))

(assert (not b!151997))

(check-sat)

(pop 1)

(push 1)

(check-sat)

